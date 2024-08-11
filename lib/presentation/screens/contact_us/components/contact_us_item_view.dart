import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class ContactUsItemView extends StatelessWidget {
  const ContactUsItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: lightGray)
      ),
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.contactUsIcon),
          5.horizontalSpace,
          Text('Customer Service',style: TextStylesManager.semiBoldStyle(fontSize: 16.sp),)

        ],
      ),
    );
  }
}
