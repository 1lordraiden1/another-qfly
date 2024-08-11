import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/login/components/login_header_view.dart';
import 'package:qfly/presentation/screens/login/components/login_options_view.dart';
import 'package:qfly/presentation/screens/signup/components/signup_inputs_view.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              60.verticalSpace,
              LoginHeaderView(),

              SignUpInputsView(),
              LoginOptionsView(),
              27.verticalSpace

            ],
          ),
        ),
      ),
    );
  }
}
