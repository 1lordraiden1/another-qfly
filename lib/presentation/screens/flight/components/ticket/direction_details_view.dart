import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/utils/common.dart';

class DirectionDetailsView extends StatelessWidget {
  const DirectionDetailsView({
    super.key,
    required this.homeCubit,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          flight.allData!.segments![0].length > 1
              ? (
                  Utility.parseDuration(
                        flight.allData!.segments![0][0].duration!.toString(),
                      ) +
                      (Utility.parseDuration(
                            flight.allData!.segments![0][1].duration!
                                .toString(),
                          ) +
                          Utility.parseDuration(
                            flight.allData!.segments![0][1].groundTime!
                                .toString(),
                          )),
                ).toString().substring(1, 9)
              : flight.allData!.segments![0][0].duration!.toString(),
          style: TextStylesManager.lightStyle(fontSize: 10.sp),
        ),
        8.verticalSpace,
        SvgPicture.asset(ImageAssets.directionIcon),
        8.verticalSpace,
        Text(
          flight.allData!.segments![0].length > 1
              ? '${flight.allData!.segments![0].length - 1} Stops'
              : 'Direct',
          style: TextStylesManager.mediumStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}
