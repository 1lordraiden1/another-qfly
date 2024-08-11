import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_view.dart';
import 'package:qfly/presentation/screens/flight_booking/flight_booking_screen.dart';
import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_amenities_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_details_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/traveller_details_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

import '../../../config/routes/app_routes.dart';

class ReviewFlightScreen extends StatefulWidget {
  const ReviewFlightScreen({
    super.key,
    required this.homeCubit,
    required this.itemId,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Flight flight;
  final String itemId;

  @override
  State<ReviewFlightScreen> createState() => _ReviewFlightScreenState();
}

class _ReviewFlightScreenState extends State<ReviewFlightScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // clear data
    widget.homeCubit.details.clear();

    widget.homeCubit.createPassengers(
      widget.homeCubit.adults +
          widget.homeCubit.children +
          widget.homeCubit.infant,
    );

    print(widget.homeCubit.passengers);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBarView(
                    title: 'Review Your Flight',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.flight.allData!.segments![0].length >
                            1) // delete this
                          TicketView(
                            isDetailed: true,
                            flight: widget.flight,
                            homeCubit: widget.homeCubit,
                          ),
                        FlightDetailsView(
                          homeCubit: widget.homeCubit,
                          flight: widget.flight,
                          details: widget.homeCubit.fareQuote,
                        ),
                        10.verticalSpace,
                        TravellerDetailsView(
                          homeCubit: widget.homeCubit,
                          flight: widget.flight,
                        ),
                        40.verticalSpace,
                        Column(
                          children: [
                            RoundedBtn(
                              title: 'Next',
                              onTap: () {
                                widget.homeCubit.passengers.any(
                                  (element) => element.isEmpty(),
                                )
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          
                                          content: Text(
                                              "Please Enter All Passengers Data"),
                                        ),
                                      )
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FlightBookingScreen(
                                                  homeCubit: widget.homeCubit,
                                                  itemId: widget.itemId,
                                                  flight: widget.flight),
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                        20.verticalSpace
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

Widget callerWidget = const Center(
  child: CircularProgressIndicator(),
);
