import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class ContainerBorderView extends StatelessWidget {
  const ContainerBorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10.r)
      ),
      child:
          Center(child: TextWithIconView(isCenter: true, iconPath: ImageAssets.costIcon, text: '\$ 20 / per night',textStyle: TextStylesManager.mediumStyle(fontSize: 16.sp,color: grey,)))


    );
  }
}
