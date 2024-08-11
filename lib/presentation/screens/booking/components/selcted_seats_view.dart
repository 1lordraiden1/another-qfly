import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectedSeatsView extends StatelessWidget {
  const SelectedSeatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h,bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selected Seats: ',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
          Text('E1,E2',style: TextStylesManager.mediumStyle(fontSize: 16.sp,color: white),),
        ],
      ),
    );
  }
}
