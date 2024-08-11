import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/cutter_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/detailed_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/serial_num_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_details_view.dart';
import 'package:qfly/presentation/screens/review_flight/review_flight_screen.dart';

import '../../../../../config/routes/app_routes.dart';

class TicketView extends StatelessWidget {
  TicketView(
      {super.key,
      required this.flight,
      required this.homeCubit,
      this.isDetailed = false});

  final HomeCubit homeCubit;
  final Flight flight;
  bool isDetailed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return InkWell(
            child: Padding(
              padding: EdgeInsets.only(bottom: 13.h),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                            blurStyle: BlurStyle.outer, //
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: isDetailed
                          ? DetailedTicketView(
                              homeCubit: homeCubit,
                              flight: flight,
                            )
                          : TicketDetailsView(
                              flight: flight,
                              homeCubit: homeCubit,
                            ),
                    ),
                  ),
                  /*   const CutterTicketView(),
                  const Flexible(child: SerialNumTicketView()) */
                ],
              ),
            ),
          );
        });
  }
}
