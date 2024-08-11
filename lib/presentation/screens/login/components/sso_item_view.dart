import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';

import '../../../../constant/text_styles_manager.dart';
class SsoItemView extends StatelessWidget {
  const SsoItemView({super.key, required this.iconPath, required this.title});
final String iconPath;
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: veryLightGray.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.r),

      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath,width: 28.w,height: 28.h,),
            8.horizontalSpace,
            Text(title,style: TextStylesManager.regularStyle(fontSize: 14.sp,),textAlign: TextAlign.center,)



          ],
        ),
      ),
    );
  }
}
