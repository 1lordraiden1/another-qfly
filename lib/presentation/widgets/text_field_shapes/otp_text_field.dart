import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/utils/media_query_values.dart';
class OtpTextFieldView extends StatelessWidget {
  const OtpTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return   OtpTextField(
fieldWidth: 60.w,
        numberOfFields: 4,
        margin: EdgeInsets.symmetric(horizontal: 10.w),

        borderColor: grey.withOpacity(0.15),
        fillColor: grey.withOpacity(0.15),
        enabledBorderColor:  grey.withOpacity(0.15),
borderWidth: 0,
        keyboardType: TextInputType.number,
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        borderRadius: BorderRadius.circular(15.r),
        filled: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              }
          );
        }, // end onSubmit

    );
  }
}
