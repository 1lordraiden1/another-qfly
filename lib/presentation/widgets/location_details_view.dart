import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/assets_manager.dart';
import '../../constant/text_styles_manager.dart';
class LocationDetailsView extends StatelessWidget {
  const LocationDetailsView({super.key, this.iconPath, this.style});
final String? iconPath;
final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath??ImageAssets.locationIcon),
        7.horizontalSpace,
        Text('Maadi , cairo',style:style?? TextStylesManager.mediumStyle(fontSize: 17.sp),)

      ],
    );
  }
}
