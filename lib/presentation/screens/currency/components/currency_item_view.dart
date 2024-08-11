import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';
class CurrencyItemView extends StatelessWidget {
  const CurrencyItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      decoration: BoxDecoration(
          border: Border.all(color: lightGray)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
5.verticalSpace,
          Text('United States Dollar',style: TextStylesManager.mediumStyle(fontSize: 14.sp),),
          Text('USD - \$',style: TextStylesManager.mediumStyle(fontSize: 12.sp,color: grey),),
        ],
      ),
    );
  }
}
