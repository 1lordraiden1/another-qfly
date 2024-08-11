import 'package:flutter/material.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithValueView extends StatelessWidget {
  const TextWithValueView({
    super.key,
    required this.text,
    required this.value,
    this.widget,
    this.textStyle,
  });
  final String text;
  final String value;
  final Widget? widget;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle ?? TextStylesManager.regularStyle(fontSize: 14.sp),
        ),
        Flexible(
          child: widget ??
              Text(
                value,
                style: TextStylesManager.regularStyle(fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
        ),
      ],
    );
  }
}
