import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageLoadingShape extends StatelessWidget {
   ImageLoadingShape({Key? key, required this.radius   }) : super(key: key);
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: Shimmer.fromColors(
            baseColor: grey,
            highlightColor: grey,

            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius:radius),

              child:  SizedBox(),
            )),

    ));

  }
}