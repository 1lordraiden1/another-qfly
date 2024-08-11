import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationView extends StatelessWidget {
  String text = 'Egypt';

  LocationView({
    super.key,
    this.text = 'Egypt',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Place Location',
          style: TextStylesManager.mediumStyle(fontSize: 16.sp),
        ),
        10.verticalSpace,
        /* Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          decoration: BoxDecoration(
              border: Border.all(color: lightGray),
              borderRadius: BorderRadius.circular(12.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWithIconView(
                
                iconPath: ImageAssets.location2Icon,
                text: text,
                textStyle: TextStylesManager.regularStyle(fontSize: 14.sp),
              ),
              SvgPicture.asset(ImageAssets.booslaIcon),
            ],
          ),
        ), */
      ],
    );
  }
}
