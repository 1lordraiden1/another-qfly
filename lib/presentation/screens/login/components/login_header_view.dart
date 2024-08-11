import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';
class LoginHeaderView extends StatelessWidget {
  const LoginHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(ImageAssets.homeLogoIcon,width: 112.w,height: 112.h,)),
          Text('Login',style: TextStylesManager.semiBoldStyle(fontSize: 28.sp,)),
          8.verticalSpace,
          InkWell(
            onTap: ()=>Navigator.pushNamed(context, Routes.signUpRoute),
            child: Row(
              children: [
                Text('Don\'t have an account?',style: TextStylesManager.regularStyle(fontSize: 15.sp,color: darkGrey)),
                6.horizontalSpace,
                Text('SignUp',style: TextStylesManager.mediumStyle(fontSize: 15.sp,color: primaryColor),)


              ],
            ),
          ),
          32.verticalSpace

        ]  );
  }
}
