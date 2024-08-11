import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/hotel_review_item_view.dart';
class HotelReviewsView extends StatelessWidget {
  const HotelReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return HotelReviewItemView();
    });
  }
}

