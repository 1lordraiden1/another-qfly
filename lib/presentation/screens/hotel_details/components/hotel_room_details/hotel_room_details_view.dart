import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/bed_options_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_header_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_item_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/room_body_details_view.dart';
class HotelRoomDetailsView extends StatelessWidget {
  const HotelRoomDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return HotelRoomItemView();
    });
  }
}
