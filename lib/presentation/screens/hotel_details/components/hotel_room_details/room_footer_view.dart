import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RoomFooterView extends StatelessWidget {
  const RoomFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        TextWithIconView(iconPath: ImageAssets.discountIcon, text: '10% Discount',textStyle: TextStylesManager.mediumStyle(fontSize: 12.sp),),
    6.verticalSpace,
     Padding(
       padding:  EdgeInsets.symmetric(horizontal: 25.w),
       child: Text('Applied to the price before taxes and fees',style: TextStylesManager.regularStyle(fontSize: 9.sp),),
     ),
        10.verticalSpace,
        Text('Price for 1 night (21 Dec - 22 Dec)',style: TextStylesManager.mediumStyle(fontSize: 10.sp),),
       4.verticalSpace,
        Row(
          children: [
            Text('US\$84',style: TextStylesManager.semiBoldThroughLineStyle(fontSize: 14.sp,color: red),),
            8.horizontalSpace,
            Text('US\$84',style: TextStylesManager.semiBoldStyle(fontSize: 14.sp),),

          ],
        ),
        4.verticalSpace,
        Text('+ US\$19 taxes and fees',style: TextStylesManager.regularStyle(fontSize: 9.sp),),
16.verticalSpace,
        RoundedBtn(title: 'Select and customize', onTap: (){})
      ],
    );
  }
}
