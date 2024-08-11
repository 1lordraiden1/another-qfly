import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BoxTextView extends StatelessWidget {
  const BoxTextView({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 4.h),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Text(text,style: TextStylesManager.mediumStyle(fontSize: 14.sp,color: primaryColor),textAlign: TextAlign.center,),
    );
  }
}
