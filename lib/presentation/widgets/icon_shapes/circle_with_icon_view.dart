import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/colors.dart';

import '../../../constant/assets_manager.dart';
class CircleWithIconView extends StatelessWidget {
  const CircleWithIconView({super.key, required this.iconPath});
final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 18.w),
      decoration: BoxDecoration(
        color: grey.withOpacity(0.2),
        shape: BoxShape.circle
      ),
      child:  Center(child: SvgPicture.asset(iconPath,width: 20.w,height: 20.h,)),
    );
  }
}
