import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
class HotelGalleryView extends StatelessWidget {
  const HotelGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>Navigator.pushNamed(context, Routes.displayImagesRoute),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: Column(


                children: [
                  Expanded(child: FancyImageShape(radius:BorderRadius.only(bottomRight:Radius.circular( 15.r)), imagePath: 'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp')),
                  2.verticalSpace,
                  Expanded(child: FancyImageShape(radius:BorderRadius.only(topRight:Radius.circular( 15.r),bottomRight:Radius.circular( 15.r)),imagePath: 'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp')),
                  2.verticalSpace,

                  Expanded(child: Stack(
                    fit: StackFit.expand,
                  children:[
                    FancyImageShape(radius:BorderRadius.only(topRight:Radius.circular( 15.r),bottomRight:Radius.circular( 15.r)),imagePath: 'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp')
      ,Align(
                        alignment: Alignment.center,
                        child: Text('+5',style: TextStylesManager.mediumStyle(fontSize: 27.sp,color: white),))

                  ])),
                  ]
              ),
            ),
            2.horizontalSpace,
            Expanded(child: FancyImageShape(radius:BorderRadius.only(bottomLeft:Radius.circular( 15.r)), imagePath: 'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp')),


          ],

      ),
    );
  }
}
