import 'package:flutter/material.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChangePassInputsView extends StatelessWidget {
  const ChangePassInputsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          TextInputView(label: 'Current Password',hint: '********',),
          24.verticalSpace,
          TextInputView(label: 'New Password',hint: '********',),
          24.verticalSpace,
          TextInputView(label: 'Re-Enter New Password',hint: '********',),
          Expanded(

              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedBtn(title: 'Reset', onTap: (){})))
        ,60.verticalSpace
        ],
      ),
    );
  }
}
