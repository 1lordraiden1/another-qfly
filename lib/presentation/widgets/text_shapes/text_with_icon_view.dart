import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithIconView extends StatelessWidget {
  const TextWithIconView(
      {super.key,
      required this.iconPath,
      this.textStyle,
      required this.text,
      this.isCenter = false,
      this.isEnd = false});
  final String iconPath;
  final String text;
  final bool isCenter;
  final bool isEnd;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCenter
          ? MainAxisAlignment.center
          : isEnd
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 15,
          height: 18,
        ),
        5.horizontalSpace,
        Text(
          text,
          style: textStyle ??
              TextStylesManager.regularStyle(fontSize: 16.sp, color: red),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
