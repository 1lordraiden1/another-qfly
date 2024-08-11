import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import '../../../../../constant/colors.dart';
class UserReviewData extends StatelessWidget {
  const UserReviewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: red

              ),
              child: Text('D',style: TextStylesManager.mediumStyle(fontSize: 18.sp,color: white),textAlign: TextAlign.center,),
            ),
            7.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dijno',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
                TextWithIconView(iconPath: ImageAssets.countryIcon, text: 'Netherland',textStyle: TextStylesManager.regularStyle(fontSize: 12.sp,color: grey),)
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 6.h),
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(6.r))
          ),
          child: Text('9.0',style: TextStylesManager.mediumStyle(fontSize: 14.sp,color: white),textAlign: TextAlign.center,),
        )


      ],
    );
  }
}
