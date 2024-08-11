import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';

class IconMinseView extends StatelessWidget {
  IconMinseView({super.key, required this.condition});

  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color: condition ? primaryColor : grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.r)),
        child: Icon(
          Icons.minimize_outlined,
          color: white,
        ));
  }
}
