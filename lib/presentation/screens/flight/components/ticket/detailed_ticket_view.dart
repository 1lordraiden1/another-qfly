import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/direction_details_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/footer_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/new_directional_details.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_item_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedTicketView extends StatelessWidget {
  const DetailedTicketView({
    super.key,
    required this.homeCubit,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: flight.allData!.segments![0].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TicketItemDetailsView(
                        homeCubit: homeCubit,
                        title: flight
                            .allData!.segments![0][index].origin!.airportCode
                            .toString(),
                        time: flight.allData!.segments![0][index].departureTime
                            .toString(),
                      ),
                      NewDirectionDetailsView(
                        index: index,
                        flight: flight,
                        homeCubit: homeCubit,
                      ),
                      TicketItemDetailsView(
                        homeCubit: homeCubit,
                        time: flight.allData!.segments![0][index].arrivalTime
                            .toString(),
                        title: flight.allData!.segments![0][index].destination!
                            .airportCode
                            .toString(),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                FooterTicketView(
                  homeCubit: homeCubit,
                  totalPrice:
                      'Ground Time : ${flight.allData!.segments![0][index].groundTime.toString()}',
                  seats: flight.allData!.segments![0][index].flightNumber
                      .toString(),
                  numOfBags: flight.allData!.segments![0][index].includedBaggage
                      .toString(),
                ),
              ],
            ),
          );
        });
  }
}
