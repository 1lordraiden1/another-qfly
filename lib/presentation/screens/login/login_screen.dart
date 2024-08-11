import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/login/components/login_header_view.dart';
import 'package:qfly/presentation/screens/login/components/login_inputs_view.dart';
import 'package:qfly/presentation/screens/login/components/login_options_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              LoginHeaderView(),
              LoginInputsView(),
              LoginOptionsView(),
            ],
          ),
        ),
      ),
    );
  }
}
