import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../constant/assets_manager.dart';
import '../../../../constant/text_styles_manager.dart';
class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(ImageAssets.homeLogoIcon,width: 112.w,height: 112.h,)),

          45.verticalSpace,
          Text('Please enter your email address to receive a verification code',style: TextStylesManager.mediumStyle(fontSize: 16.sp,),textAlign: TextAlign.center,),
40.verticalSpace,
          TextInputView(label: 'Email',iconPath: ImageAssets.emailIcon,hint: 'Email',),
          40.verticalSpace,
          Expanded(child: Align(
              alignment: Alignment.bottomCenter,
              child: RoundedBtn(title: 'Send', onTap: ()=>Navigator.pushNamed(context, Routes.otpRoute),)))
        ,142.verticalSpace,
        ],
      ),
    );
  }
}
