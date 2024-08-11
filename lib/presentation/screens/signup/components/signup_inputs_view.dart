import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import '../../../widgets/text_shapes/text_input_view.dart';
class SignUpInputsView extends StatelessWidget {
  const SignUpInputsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputView(label: 'Name',iconPath: ImageAssets.userIcon,),
        24.verticalSpace,
        TextInputView(label: 'Mobile Number',iconPath: ImageAssets.phoneIcon,hint: 'Mobile'),
        24.verticalSpace,
        TextInputView(label: 'Email',iconPath: ImageAssets.emailIcon,hint: 'Email',),
        24.verticalSpace,

        TextInputView(label: 'Password',iconPath: ImageAssets.passIcon,hint: '*******',isPassword: true,),

      ],
    );
  }
}
