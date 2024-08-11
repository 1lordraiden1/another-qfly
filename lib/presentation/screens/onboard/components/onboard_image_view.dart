import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/assets_manager.dart';
class OnBoardImageView extends StatelessWidget {
  const OnBoardImageView({super.key, required this.pageIndex});
final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular( 100.r)),
        image: DecorationImage(
            image: AssetImage(
             pageIndex==2?ImageAssets.onboard2BgImg:ImageAssets.onboardBgImg,

            ),
          fit: BoxFit.fill
        ),
      )
      ,
    );
  }
}
