import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/location_details_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/text_shapes/box_text_view.dart';
class HotelHeaderView extends StatelessWidget {
  const HotelHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxTextView(text: 'Hotel'),
              TextWithIconView(iconPath: ImageAssets.rateIcon, text: '4.9(05 Reviews)',textStyle: TextStylesManager.mediumStyle(fontSize: 12.sp),)

            ],
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Altwhed Hotel',style: TextStylesManager.mediumStyle(fontSize: 18.sp),)
              ,SvgPicture.asset(ImageAssets.shareIcon)
            ],
          ),
          4.verticalSpace,
          TextWithIconView(iconPath: ImageAssets.locationGreenIcon, text: 'Cairo , Egypt',textStyle: TextStylesManager.regularStyle(fontSize: 10.sp,color: grey),)
        ],
      ),
    );
  }
}
