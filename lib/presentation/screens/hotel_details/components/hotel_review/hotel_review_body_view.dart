import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/review_desc_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class HotelReviewBodyView extends StatelessWidget {
  const HotelReviewBodyView({super.key});

  @override
  Widget build(BuildContext context) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text('Excellent',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
        Text('Verified review - Sat, 18 Nov 2023',style: TextStylesManager.regularStyle(fontSize: 12.sp),),
      14.verticalSpace,
      ReviewDescView(
          text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled itto make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
      ,   16.verticalSpace,
        Text('Stayed in October 2023',style: TextStylesManager.mediumStyle(fontSize: 12.sp),),
TextWithIconView(iconPath: ImageAssets.likeIcon, text: 'Helpful',textStyle: TextStylesManager.mediumStyle(fontSize: 14.sp,color: blue),isEnd: true,),
        16.verticalSpace,
        Divider(thickness: 1,)

      ],
    );
  }
}
