import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/colors.dart';

import '../../../constant/assets_manager.dart';
class FavoriteIconView extends StatelessWidget {
  const FavoriteIconView({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
      decoration:const BoxDecoration(
          color: white,
          shape: BoxShape.circle
      ),
      child:   SvgPicture.asset(iconPath,width: 15.w,height: 15.h,),
    );
  }
}
