import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import '../../../../../constant/text_styles_manager.dart';

class HeaderFilterView extends StatelessWidget {
  String title;
  HeaderFilterView({
    super.key,
    this.title = 'Travelers',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
              color: lightGray.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStylesManager.semiBoldStyle(fontSize: 22.sp),
            ),
            InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: grey,
                ))
          ],
        ),
      ),
    );
  }
}
