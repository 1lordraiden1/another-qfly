import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightTripDestinationView extends StatelessWidget {
  const FlightTripDestinationView({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(ImageAssets.flightTripImg),
        Row(
          children: [
            Text(
              homeCubit.classTypes[homeCubit.selectedClassType],
              style: TextStylesManager.lightStyle(fontSize: 10.sp, color: grey),
            ),
            15.horizontalSpace,
            Text(
              '${homeCubit.adults + homeCubit.children + homeCubit.infant} Traveler',
              style: TextStylesManager.lightStyle(fontSize: 10.sp, color: grey),
            ),
          ],
        )
      ],
    );
  }
}
