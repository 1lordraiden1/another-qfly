import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
class CutterTicketView extends StatelessWidget {
  const CutterTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) =>
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h),
            height: 7.h,
            width: 2.w,
            decoration: BoxDecoration(
                color: lightGray,

                borderRadius: BorderRadius.circular(5.r)
            ),
          ),
        ),


    ));
  }
}
