import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class WalletBodyView extends StatelessWidget {
  const WalletBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 15.w),
      decoration: BoxDecoration(
        border: Border.all(color: lightGray)
      ),
      child: Column(
        children: [
          TextWithIconView(iconPath: ImageAssets.walletIcon, text: 'Your balance',textStyle: TextStylesManager.semiBoldStyle(fontSize: 14.sp),),
13.verticalSpace,
          Text('\$ 200',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
          11.verticalSpace,
          Divider(height: 2.h,),
          10.verticalSpace,
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
          style: TextStylesManager.regularStyle(fontSize: 10.sp),textAlign: TextAlign.center,),
          16.verticalSpace

        ],
      ),
    );
  }
}
