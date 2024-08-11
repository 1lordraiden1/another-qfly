import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class OrView extends StatelessWidget {
  const OrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: grey,
          ),
        ),
        10.horizontalSpace,
        Text('OR',style: TextStylesManager.regularStyle(fontSize: 18.sp,color: grey),),
        10.horizontalSpace,

        Expanded(
          child: Container(
            height: 1.h,
            color: grey,
          ),
        ),
      ],
    );
  }
}
