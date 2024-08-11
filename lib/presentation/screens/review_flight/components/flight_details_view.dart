import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_value_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightDetailsView extends StatelessWidget {
  const FlightDetailsView({
    super.key,
    required this.homeCubit,
    required this.details,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final FareQuote details;
  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWithValueView(
          text:
              '${homeCubit.adults} ${homeCubit.adults > 1 ? 'Adults' : 'Adult'}',
          value:
              '\$${(flight.fareBreakdown![0].totalFare!).toStringAsFixed(2)}',
        ),
        homeCubit.children > 0
            ? TextWithValueView(
                text:
                    '${homeCubit.children} ${homeCubit.children > 1 ? 'Children' : 'Child'}',
                value:
                    '\$${(flight.fareBreakdown![1].totalFare!).toStringAsFixed(2)}',
              )
            : const SizedBox(),
        homeCubit.infant > 0
            ? TextWithValueView(
                text:
                    '${homeCubit.infant} ${homeCubit.infant > 1 ? 'Infants' : 'Infant'}',
                value:
                    '\$${(flight.fareBreakdown![2].totalFare!).toStringAsFixed(2)}',
              )
            : const SizedBox(),
        8.verticalSpace,
        TextWithValueView(
          text: 'Total',
          value: '\$${flight.fare!.totalFare!.toStringAsFixed(2)}',
        ),
        8.verticalSpace,
        Text(
          'Included Baggage : ${flight.allData!.segments![0][0].includedBaggage.toString()}',
          style: TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
        8.verticalSpace,
        Text(
          'Cabin Baggage : ${flight.allData!.segments![0][0].cabinBaggage.toString()}',
          style: TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
        8.verticalSpace,
        Text(
          'Airline Name : ${flight.allData!.segments![0][0].airlineName.toString()}',
          style: TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
        8.verticalSpace,
        Text(
          'Is LCC  : ${flight.isLcc.toString()}',
          style: TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
        8.verticalSpace,
        /* Text(
          '${flight.allData!.segments![0].length > 1 ? '${flight.allData!.segments![0].length - 1} Stops' : 'Non Stop'} ',
          style: TextStylesManager.mediumStyle(fontSize: 14.sp, color: red),
        ),
        8.verticalSpace,
        flight.allData!.segments![0].length > 1
            ? SizedBox(
                height: 100 / flight.allData!.segments![0].length,
                child: ListView.builder(
                  itemCount: flight.allData!.segments![0].length - 1,
                  itemBuilder: (context, index) => TextWithValueView(
                    text: 'Ground Time',
                    value:
                        '${flight.allData!.segments![0][index + 1].groundTime.toString()} ',
                  ),
                ),
              )
            : const SizedBox(),
        6.verticalSpace,
        Text(
          'Trip Duration : ${flight.allData!.segments![0][0].duration!.toString()}',
          style: TextStylesManager.regularStyle(
            fontSize: 12.sp,
          ),
        ),
        5.verticalSpace,
        Text(
          'Flight No : ${flight.allData!.segments![0][0].flightNumber!.toString()}',
          style: TextStylesManager.regularStyle(
            fontSize: 12.sp,
          ),
        ),
        5.verticalSpace,
        Text(
          'Cabin Class : ${flight.allData!.segments![0][0].cabinClass!.toString()}',
          style: TextStylesManager.regularStyle(
            fontSize: 12.sp,
          ),
        ),
        5.verticalSpace,
        Text(
          'LCC : ${flight.allData!.isLcc.toString()}',
          style: TextStylesManager.regularStyle(
            fontSize: 12.sp,
          ),
        ),
        5.verticalSpace,
         */ /*   Text(
          'Trip Duration : ${flight.allData!.segments![0][0].duration!.toString()}',
          style: TextStylesManager.regularStyle(
            fontSize: 12.sp,
          ),
        ), */
        Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Taxes and fees included',
              style: TextStylesManager.regularStyle(
                fontSize: 10.sp,
              ),
            )),
      ],
    );
  }
}
