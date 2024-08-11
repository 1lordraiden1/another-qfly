import 'package:flutter/material.dart';

import '../../../../../constant/assets_manager.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/text_styles_manager.dart';
import '../../../../widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateView extends StatelessWidget {
  DateTime date;
  bool isCenter;
  DateView({super.key, required this.date, this.isCenter =false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: lightGray),
      ),
      child: Flexible(
        child: TextWithIconView(
          isCenter: isCenter,
          iconPath: ImageAssets.dateIcon,
          text: date.year.toString() +
              '-' +
              date.month.toString() +
              '-' +
              date.day.toString(),
          textStyle: TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
