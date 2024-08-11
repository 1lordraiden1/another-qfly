import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class CvvNoteView extends StatelessWidget {
  const CvvNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      SvgPicture.asset(ImageAssets.infoIcon),
      2.horizontalSpace,
      Text('The 3 digit numbers printed on the back of the card',style: TextStylesManager.lightStyle(fontSize: 10.sp,color: red),)


    ],);
  }
}
