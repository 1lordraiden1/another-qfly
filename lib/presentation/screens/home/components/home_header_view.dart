import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/location_details_view.dart';
class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 40.h,bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocationDetailsView(),
          Image.asset(ImageAssets.homeLogoIcon,width: 56.w,height: 56.h,),

        ],
      ),
    );
  }
}
