import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/otp/components/otp_body.dart';
import 'package:qfly/presentation/widgets/app_bar/simple_app_bar_view.dart';
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SimpleAppBarView(title: 'Forgot Password?'),
            OtpBody()


          ],
        ),
      ),
    );
  }
}
