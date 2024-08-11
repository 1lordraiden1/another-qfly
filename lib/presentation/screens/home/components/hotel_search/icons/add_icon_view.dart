import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/constant/colors.dart';

class AddIconView extends StatelessWidget {
  const AddIconView({super.key, this.borderColor, this.icon});
  final Color? borderColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: borderColor ?? primaryColor,
        ),
      ),
      child: Center(
        child: Icon(
          
          icon ?? Icons.add,
          color: borderColor ?? primaryColor,
        ),
      ),
    );
  }
}
