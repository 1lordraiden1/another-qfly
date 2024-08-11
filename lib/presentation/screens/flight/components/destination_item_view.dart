import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationItemView extends StatelessWidget {
  const DestinationItemView({
    super.key,
    required this.destination,
    required this.airport,
    this.date,
    this.time,
  });
  final String destination;
  final String airport;
  final String? date;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        date != null
            ? Text(
                date!,
                style:
                    TextStylesManager.lightStyle(fontSize: 10.sp, color: grey),
              )
            : SizedBox(
                height: 10.h,
              ),
        date != null
            ? Text(
                time!,
                style:
                    TextStylesManager.lightStyle(fontSize: 10.sp, color: grey),
              )
            : SizedBox(
                height: 10.h,
              ),
        2.verticalSpace,
        Text(
          airport,
          style: TextStylesManager.mediumStyle(fontSize: 18.sp),
        ),
        2.verticalSpace,
        Text(
          destination,
          style: TextStylesManager.lightStyle(fontSize: 10.sp, color: grey),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
