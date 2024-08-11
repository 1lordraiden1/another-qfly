import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';

class RoundedBtn extends StatelessWidget {
  const RoundedBtn(
      {Key? key,
      required this.title,
      this.width,
      this.height,
      required this.onTap,
      this.style,
      this.color,
      this.textColor,
      this.radius})
      : super(key: key);
  final String title;
  final double? width;
  final double? height;
  final double? radius;
  final void Function() onTap;
  final TextStyle? style;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Center(
        child: Text(
          title.tr(),
          style: style ??
              TextStylesManager.mediumStyle(
                  fontSize: 25.sp, color: textColor ?? white),
        ),
      ),
      style: ElevatedButton.styleFrom(
        //fixedSize: Size((width??context.width).w, (height??60).h),
        backgroundColor: color ?? primaryColor,
    
        ///primary
        //maximumSize: Size((width ?? context.width).w, (height ?? 60).h),
    
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.w), // <-- Radius
        ),
      ),
    );
  }
}
