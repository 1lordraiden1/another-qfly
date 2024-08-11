import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/bed_options_view.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class HotelRoomHeaderView extends StatelessWidget {
  const HotelRoomHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Flexible(
         flex: 2,
         child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Double or Twin Room',style: TextStylesManager.semiBoldStyle(fontSize: 14.sp),),
                4.verticalSpace,
                Text('Non-refundable',style: TextStylesManager.regularStyle(fontSize: 12.sp),),
                14.verticalSpace,
                TextWithIconView(iconPath: ImageAssets.adultsIcon, text: 'Price for 2 adults',textStyle: TextStylesManager.regularStyle(fontSize: 12.sp),),
                8.verticalSpace,
              ],
            ),
       ),

       Flexible(
         child: FittedBox(
           fit: BoxFit.scaleDown,
           child: FancyImageShape(height: 80.h,width: 80.w, imagePath:'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
                  radius: BorderRadius.all(Radius.circular(5.r))),
         ),
       ),

      ],
    );
  }
}
