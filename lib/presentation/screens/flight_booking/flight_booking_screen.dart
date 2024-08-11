import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_view.dart';
import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_amenities_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_details_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/traveller_details_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

import '../../../config/routes/app_routes.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({
    super.key,
    required this.homeCubit,
    required this.itemId,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Flight flight;
  final String itemId;

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
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

    widget.homeCubit.handleGettingFlightDetails(
      widget.flight.allData!.segments![0][0].origin.toString(),
      widget.flight.allData!.segments![0][0].origin.toString(),
      widget.itemId,
      widget.flight.isLcc!,
      widget.flight.companyName!,
    );
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
                        40.verticalSpace,
                        BlocConsumer<HomeCubit, HomeState>(
                          bloc: widget.homeCubit,
                          listener: (context, state) {},
                          builder: (context, snapshot) {
                            return widget.homeCubit.isSearchFlightDetailsLoading
                                ? const Center(
                                    child: Column(
                                      children: [
                                        CircularProgressIndicator(),
                                        Text("Calculating Payment...")
                                      ],
                                    ),
                                  )
                                : RoundedBtn(
                                    title: 'Continue To Payment',
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                            homeCubit: widget.homeCubit,
                                            flight: widget.flight,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          },
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
