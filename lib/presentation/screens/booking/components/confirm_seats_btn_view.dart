import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/utils/media_query_values.dart';
class ConfirmSeatsBtnView extends StatelessWidget {
  const ConfirmSeatsBtnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      decoration: BoxDecoration(
        color: secondGray.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.r)
      ),
      child: Stack(
        children:[
            Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.h),
                child: SvgPicture.asset(ImageAssets.directionIcon),
              ),
            ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.r),
                    color: firstGray
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                  child: SvgPicture.asset(ImageAssets.seatIcon),
                ),
              ),
            ),
          

          ],

      ),
    );
  }
}
