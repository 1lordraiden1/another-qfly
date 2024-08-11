import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_body_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_gallery_view.dart';
class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(

              child: HotelGalleryView()),
          Expanded(

              child: HotelBodyView())

        ],),
      ),
    );
  }
}
