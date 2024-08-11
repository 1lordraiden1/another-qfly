import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import '../../../../../constant/colors.dart';
class SerialNumTicketView extends StatelessWidget {
  const SerialNumTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 5.w),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ]),
        child: Image.asset(ImageAssets.serialImg,fit: BoxFit.fill,)
    );
  }
}
