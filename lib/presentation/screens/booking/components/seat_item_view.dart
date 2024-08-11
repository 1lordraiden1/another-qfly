import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class SeatItemView extends StatelessWidget {
  const SeatItemView({super.key, required this.color, required this.title});
final Color color;
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h,right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Text(title,style: TextStylesManager.regularStyle(fontSize: 16.sp,color: white),),
    );
  }
}
