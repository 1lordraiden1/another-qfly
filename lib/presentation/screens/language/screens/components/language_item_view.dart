import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/text_styles_manager.dart';

class LanguageItemView extends StatelessWidget {
  const LanguageItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(color: lightGray)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              Text('Spanish',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
              Text('Spanish',style: TextStylesManager.mediumStyle(fontSize: 12.sp,color: grey),),
            ],
          ),
          SvgPicture.asset(ImageAssets.spanishIcon)
        ],
      ),
    );
  }
}
