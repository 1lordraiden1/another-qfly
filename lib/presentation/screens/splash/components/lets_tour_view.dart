import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';

import '../../../../config/routes/app_routes.dart';
class LetsTourView extends StatelessWidget {
  const LetsTourView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, Routes.onBoardRoute, (route) => false),
      child: Container(
        margin: EdgeInsets.only(top: 50.h,left: 14.w),
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 18.w),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(topLeft:Radius.circular( 20.r),bottomLeft:Radius.circular( 20.r) ,bottomRight:Radius.circular( 20.r) )
        ),
        child: Text('Let\'s Tour',style: TextStylesManager.mediumStyle(fontSize: 18.sp,color: white),),
      ),
    );
  }
}
