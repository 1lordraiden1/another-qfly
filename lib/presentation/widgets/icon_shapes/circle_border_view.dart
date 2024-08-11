import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant/colors.dart';
class CircleBorderView extends StatelessWidget {
  const CircleBorderView({super.key, required this.iconPath});
   final String iconPath;

  @override
  Widget build(BuildContext context) {

      return Container(
        width: 57.w,
        height: 60.h,
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 18.w),
        decoration: BoxDecoration(
            color: grey.withOpacity(0.1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r),bottomLeft:  Radius.circular(40.r))

        ),
        child:  Center(child: SvgPicture.asset(iconPath,width: 20.w,height: 20.h)),
      );
    }


}
