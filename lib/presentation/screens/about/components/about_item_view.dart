import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AboutItemView extends StatelessWidget {
  const AboutItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:16.h ),
      decoration: BoxDecoration(

        border: Border.all(color: lightGray)
      ),
      child: ExpansionTile(title: Row(
        children: [
          SvgPicture.asset(ImageAssets.aboutFaqIcon),
          12.horizontalSpace,
          Text('Can I Track my order\'s delivery status?',style: TextStylesManager.mediumStyle(fontSize: 14.sp),),

        ],
      ),
        iconColor: primaryColor,
        childrenPadding: EdgeInsets.symmetric(vertical: 10.h),
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
            style: TextStylesManager.regularStyle(fontSize: 12.sp,color: grey),),
          )
        ],


      ),
    );
  }
}
