import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/bed_options_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/room_facilities_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/room_footer_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RoomBodyDetailsView extends StatelessWidget {
  const RoomBodyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BedOptionsView(),
        8.verticalSpace,
        TextWithIconView(iconPath: ImageAssets.zoomIcon, text: 'Room size: 40 m',textStyle: TextStylesManager.regularStyle(fontSize: 12.sp),)
       , 14.verticalSpace,
        RoomFacilitiesView(),
        RoomFooterView()

      ],
    );
  }
}
