import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetShape {
  final Widget shape;

  BottomSheetShape(this.shape);

  build(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(minHeight: 100.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: shape,
          );
        });
  }
}
