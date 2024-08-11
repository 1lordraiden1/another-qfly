import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class TextWithBorder extends StatelessWidget {
  const TextWithBorder({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121.w,
      height: 47.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: primaryColor)
      ),

        child: Center(child: Text(text,style: TextStylesManager.mediumStyle(fontSize: 18.sp),)),

    );
  }
}
