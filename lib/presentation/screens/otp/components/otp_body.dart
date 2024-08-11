import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/otp_text_field.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

import '../../../../constant/assets_manager.dart';
import '../../../../constant/text_styles_manager.dart';
class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(ImageAssets.homeLogoIcon,width: 112.w,height: 112.h,)),

          45.verticalSpace,
 Text('Please enter the 4 digit code sent\n to your mail',style: TextStylesManager.mediumStyle(fontSize: 16.sp,),textAlign: TextAlign.center,),
          62.verticalSpace,
OtpTextFieldView(),
          14.verticalSpace,
          Text('Resend Code',style: TextStylesManager.regularUnderLineStyle(fontSize: 14.sp,color: primaryColor,),textAlign: TextAlign.center,),

Expanded(child: Align(
  alignment: Alignment.bottomCenter,
  child: RoundedBtn(title: 'Confirm', onTap: () {  },),
)),
          142.verticalSpace
        ],
      ),
    );
  }
}
