import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_travelers_view.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/date_view.dart';
import 'package:qfly/presentation/screens/home/components/trip_way_view.dart';
import 'package:qfly/presentation/widgets/bottom_sheet.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripDetailsView extends StatefulWidget {
  const TripDetailsView({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  State<TripDetailsView> createState() => _TripDetailsViewState();
}

DateTime date = DateTime.now();

class _TripDetailsViewState extends State<TripDetailsView> {
  _showFlightDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (value) {
        setState(() {
          date = value!;
          widget.homeCubit.handleFlightDateChanging(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(
        children: [
          TripWayView(
            homeCubit: widget.homeCubit,
          ),
          GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showFlightDatePicker(),
                    child: DateView(
                      date: widget.homeCubit.flightDate,
                      isCenter: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          14.verticalSpace,
          RoundedBtn(
            title: 'Search and book!',
            onTap: () {
              if (widget.homeCubit.airportTo.name.isEmpty ||
                  widget.homeCubit.airportFrom.name.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        const Text("Please Enter your Origin & Destination"),
                    backgroundColor: red,
                    showCloseIcon: true,
                  ),
                );
              } else if (widget.homeCubit.airportTo.name ==
                  widget.homeCubit.airportFrom.name) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                        "Please Select Different Origin or Destination"),
                    backgroundColor: red,
                    showCloseIcon: true,
                  ),
                );
              } else {
                BottomSheetShape(
                  FilterTravelersView(
                    homeCubit: widget.homeCubit,
                  ),
                ).build(context);
              }
            },
          ),
        ],
      );
    });
  }
}
