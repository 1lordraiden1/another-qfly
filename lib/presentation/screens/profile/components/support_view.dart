import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/profile/components/profile_item_view.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../constant/assets_manager.dart';
import '../../../../constant/text_styles_manager.dart';
class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Support and Terms',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
          16.verticalSpace,
          ProfileItemView(title: 'Language',iconPath: ImageAssets.languageIcon,route: Routes.languageRoute,),
          ProfileItemView(title: 'Currency',iconPath: ImageAssets.currencyIcon,route: Routes.currencyRoute,),
          ProfileItemView(title: 'Contact Us',iconPath: ImageAssets.contactUsIcon,route: Routes.contactUsRoute,),
          ProfileItemView(title: 'Terms And Conditions',iconPath: ImageAssets.termsIcon,route: Routes.termsRoute,),
          ProfileItemView(title: 'Privacy Policy',iconPath: ImageAssets.privacyIcon,route: Routes.privacyPolicyRoute,),
          ProfileItemView(title: 'About QFLY',iconPath: ImageAssets.aboutIcon,route: Routes.aboutRoute,),
          ProfileItemView(title: 'Log Out',iconPath: ImageAssets.logoutIcon),
        ],
      ),
    );
  }
}
