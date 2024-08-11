import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/hotel_review_body_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/user_review_data.dart';
class HotelReviewItemView extends StatelessWidget {
  const HotelReviewItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        UserReviewData(),
        HotelReviewBodyView()
      ],
    );
  }
}
