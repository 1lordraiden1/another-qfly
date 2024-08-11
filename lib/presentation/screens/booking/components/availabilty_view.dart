import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/availability_model.dart';
class AvailabilityView extends StatelessWidget {
   AvailabilityView({super.key});
final List<AvailabilityModel>items=[AvailabilityModel(title: 'Available', color: primaryColor),AvailabilityModel(title: 'Reserved', color: grey),AvailabilityModel(title: 'Selected', color: darkBlue)];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 36.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) => Row(
          children: [
            Container(
              height: 21.h,
              width: 21.w,
              decoration: BoxDecoration(
                color: items[index].color,
                borderRadius: BorderRadius.circular(7.r)
              ),
            ),
            6.horizontalSpace,
            Text(items[index].title,style: TextStylesManager.regularStyle(fontSize: 12.sp),)
          ],
        )),
      ),
    );
  }
}
