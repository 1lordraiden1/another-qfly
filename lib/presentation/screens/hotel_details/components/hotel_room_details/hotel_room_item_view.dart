import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/bed_options_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_header_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/room_body_details_view.dart';
class HotelRoomItemView extends StatelessWidget {
  const HotelRoomItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 11.h),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        children: [
         HotelRoomHeaderView(),
          RoomBodyDetailsView()

        ],
      ),
    );
  }
}
