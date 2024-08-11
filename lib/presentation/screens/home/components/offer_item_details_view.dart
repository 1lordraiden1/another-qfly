import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class OfferItemDetailsView extends StatelessWidget {
  const OfferItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('The Curve',style: TextStylesManager.semiBoldStyle(fontSize: 16.sp),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(ImageAssets.rateIcon),
                  Text('4.9',style: TextStylesManager.mediumStyle(fontSize: 11.sp),),


                ],
              )

            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWithIconView(iconPath: ImageAssets.location2Icon, text: 'Egypt',textStyle: TextStylesManager.lightStyle(fontSize: 12.sp,color: grey),),
              Row(
                children: [
                  Text('\$2.984/',style: TextStylesManager.lightStyle(fontSize: 12.sp,color: primaryColor.withOpacity(0.5)),),
                  Text('Night',style: TextStylesManager.lightStyle(fontSize: 12.sp,),),

                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
