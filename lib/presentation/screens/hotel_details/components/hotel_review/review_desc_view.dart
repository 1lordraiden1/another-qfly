import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';

import '../../../../../constant/text_styles_manager.dart';
class ReviewDescView extends StatelessWidget {
  const ReviewDescView({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(ImageAssets.optimisticIcon),
        5.horizontalSpace,
        Flexible(child: Text(text,style:TextStylesManager.regularStyle(fontSize: 16.sp,color: grey),))

      ],
    );
  }
}
