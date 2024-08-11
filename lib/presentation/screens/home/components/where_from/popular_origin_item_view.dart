import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class PopularOriginItemView extends StatelessWidget {
  const PopularOriginItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Column(
        children: [
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImageAssets.popularOriginIcon),
                  10.horizontalSpace,
                  Column(
                    children: [
                      Text('Dubai (All Airports)',style: TextStylesManager.mediumStyle(fontSize: 14.sp),),
                      6.verticalSpace,
                      Text('United Arab Emirates',style: TextStylesManager.lightStyle(fontSize: 12.sp,color: grey),),

                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: lightGray
                ),
                child: Text('DXB',style: TextStylesManager.mediumStyle(fontSize: 12.sp),),
              )


            ],
          ),
          15.verticalSpace,
          Divider(thickness: 1,)

        ],

    );
  }
}
