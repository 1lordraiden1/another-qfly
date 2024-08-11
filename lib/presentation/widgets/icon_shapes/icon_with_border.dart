import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
class IconWithBorder extends StatelessWidget {
  const IconWithBorder({super.key, required this.icon});
final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121.w,
      height: 47.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: primaryColor)
      ),
      child: Center(child: SvgPicture.asset(icon,width: 53.w,height: 17.h,)),

    );
  }
}
