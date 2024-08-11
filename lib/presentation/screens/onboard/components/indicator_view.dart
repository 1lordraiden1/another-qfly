import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
class IndicatorView extends StatelessWidget {
  const IndicatorView({super.key, required this.isSelected});
final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 5.h,
      width: 45.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color:isSelected?primaryColor: grey
      ),
    );
  }
}
