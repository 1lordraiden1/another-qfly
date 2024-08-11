import 'package:flutter/material.dart';

import '../../../../constant/assets_manager.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';
import '../../../widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        24.verticalSpace,
        Text('User name',style: TextStylesManager.semiBoldStyle(fontSize: 18.sp),),
        TextWithIconView(iconPath: ImageAssets.locationIcon, text: 'Egypt , Maadi',textStyle: TextStylesManager.regularStyle(fontSize: 14.sp,color: grey),isCenter: true,)
      ],
    );
  }
}
