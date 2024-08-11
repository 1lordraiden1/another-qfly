import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/hotels/components/hotel_image_view.dart';
import 'package:qfly/presentation/screens/hotels/components/room_details_view.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:qfly/utils/media_query_values.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        decoration: BoxDecoration(
            color: lightGray.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelImageView(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Altawhed Hotel',
                    style: TextStylesManager.mediumStyle(fontSize: 16.sp),
                  ),
                  2.verticalSpace,
                  TextWithIconView(
                    iconPath: ImageAssets.locationGreenIcon,
                    textStyle: TextStylesManager.regularStyle(
                        fontSize: 10.sp, color: grey),
                    text: 'Cairo ,Egypt',
                  ),
                  7.verticalSpace,
                  Text(
                    'Reviews',
                    style: TextStylesManager.regularStyle(
                        fontSize: 9.sp, color: grey),
                  ),
                  1.verticalSpace,
                  TextWithIconView(
                    iconPath: ImageAssets.rateIcon,
                    textStyle: TextStylesManager.mediumStyle(fontSize: 11.sp),
                    text: '4.9(05 Reviews)',
                  ),
                  7.verticalSpace,
                  RoomDetailsView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
