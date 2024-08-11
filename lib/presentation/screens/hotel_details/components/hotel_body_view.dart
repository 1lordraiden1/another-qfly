import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_header_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_tabbar_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/box_text_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HotelBodyView extends StatelessWidget {
  const HotelBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelHeaderView(),
          Expanded(child: HotelTabbarView())


        ],
      ),
    );
  }
}
