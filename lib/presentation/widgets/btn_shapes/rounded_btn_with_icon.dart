
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';

class RoundedBtnWithIcon extends StatelessWidget {
  const RoundedBtnWithIcon({Key? key, required this.title, required this.onTap, this.style, this.color, this.textColor, this.radius}) : super(key: key);
  final String title;

  final double? radius;
  final  void Function() onTap;
  final TextStyle? style;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(


      onPressed: onTap,
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageAssets.bookIcon),
          7.horizontalSpace,
          Text(title.tr(),style: style??TextStylesManager.mediumStyle(fontSize: 12.sp,color: textColor??white) ,),
        ],
      )),
      style: ElevatedButton.styleFrom(
        backgroundColor: color??primaryColor,  /// primary

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(30.w), // <-- Radius
        ),
      ),
    );
  }
}
