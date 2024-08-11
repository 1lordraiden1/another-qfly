import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
class BackBtnView extends StatelessWidget {
  const BackBtnView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: 15.w),
        decoration: BoxDecoration(
          color: lightGray.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
