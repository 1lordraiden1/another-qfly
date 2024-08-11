import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class FilterItemResult extends StatelessWidget {
  const FilterItemResult({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
        decoration: BoxDecoration(
          color: lightBlue,

          borderRadius: BorderRadius.circular(12.r)
        ),
        child: TextWithIconView(iconPath: ImageAssets.locationGreenIcon,text: 'Cairo , Egypt',textStyle: TextStylesManager.regularStyle(fontSize: 14.sp),),

    );
  }
}
