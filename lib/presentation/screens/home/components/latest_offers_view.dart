import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/home/components/flight_item_view.dart';
import 'package:qfly/presentation/screens/home/components/offer_item_view.dart';
import 'package:qfly/presentation/widgets/category_header_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';class LatestOfferView extends StatelessWidget {
  const LatestOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryHeaderView(title: 'Latest Offers'),
        19.verticalSpace,
       
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(children: List.generate(5, (index) =>

                   OfferItemView()
              ),
        ),
         )
      ],
    );
  }
}
