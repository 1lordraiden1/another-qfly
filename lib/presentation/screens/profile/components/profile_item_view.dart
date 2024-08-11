import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';

import '../../../../constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/icon_shapes/circle_with_icon_view.dart';
class ProfileItemView extends StatelessWidget {
  const ProfileItemView({super.key, required this.title, required this.iconPath,  this.route});
final String title;
final String iconPath;
final String?  route;
  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: (){
        if(route!=null)Navigator.pushNamed(context, route!);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: veryLightGray.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30.r),

        ),
        child: Row(

          children: [
            CircleWithIconView(iconPath: iconPath,),
            5.horizontalSpace,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: TextStylesManager.mediumStyle(fontSize: 14.sp),),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20.w),
                   child: SvgPicture.asset(ImageAssets.rightArrowIcon,color: grey,),
                 ),

                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
