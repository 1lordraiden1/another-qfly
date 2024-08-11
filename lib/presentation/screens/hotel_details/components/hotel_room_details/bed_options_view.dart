import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant/text_styles_manager.dart';
class BedOptionsView extends StatelessWidget {
  const BedOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SvgPicture.asset(ImageAssets.bedIcon),
        8.horizontalSpace,
        Column(
          children: [
         Text('Option 1:2 twin beds',style:  TextStylesManager.regularStyle(fontSize: 12.sp)),
         8.verticalSpace,
         Text('Option 2:1 King bed',style:  TextStylesManager.regularStyle(fontSize: 12.sp)),
          ],
        )

      ],
    );
  }
}
