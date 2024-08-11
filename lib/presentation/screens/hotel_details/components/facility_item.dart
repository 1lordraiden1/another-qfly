import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class FacilityItem extends StatelessWidget {
  const FacilityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right:16.w ),
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
      decoration: BoxDecoration(
        color: blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        children: [
          15.verticalSpace,
          SvgPicture.asset(ImageAssets.cinemaIcon),
          10.verticalSpace,
          Text('Cinema',style: TextStylesManager.mediumStyle(fontSize: 12.sp,color: red),)
        ],
      ),

    );
  }
}
