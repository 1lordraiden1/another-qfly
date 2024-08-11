import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class FavoriteDetailsView extends StatelessWidget {
  const FavoriteDetailsView({super.key, this.width});
final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width?? 140.w,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('The Curve',style: TextStylesManager.mediumStyle(fontSize: 12.sp,color: white),),
            TextWithIconView(iconPath: ImageAssets.location2Icon, text: 'Egypt',textStyle: TextStylesManager.lightStyle(fontSize: 6.sp,color: white),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               TextWithIconView(iconPath: ImageAssets.rateIcon, text: '4.9(35)',textStyle: TextStylesManager.lightStyle(fontSize: 8.sp,color: white),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: primaryColor
                  ),
                  child: Text('\$138',style: TextStylesManager.lightStyle(fontSize: 6.sp,color: white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
