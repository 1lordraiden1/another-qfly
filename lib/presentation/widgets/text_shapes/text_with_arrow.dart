import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class TextWithArrow extends StatelessWidget {
  const TextWithArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Property Policies',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
        SvgPicture.asset(ImageAssets.rightArrowIcon)

      ],
    );
  }
}
