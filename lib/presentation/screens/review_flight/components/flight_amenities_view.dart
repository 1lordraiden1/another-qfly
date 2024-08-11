import 'package:flutter/material.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../constant/assets_manager.dart';
class FlightAmenitiesView extends StatelessWidget {
  const FlightAmenitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Flight Amenities',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
          10.verticalSpace,
          Wrap(

            direction: Axis.horizontal,
            spacing: 24.w,
            children: List.generate(5, (index) => TextWithIconView(iconPath: ImageAssets.wifiIcon,text: 'Wifi',)),),
          24.verticalSpace,

        ],

    );
  }
}
