import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotel_details/components/facility_item.dart';
import 'package:qfly/presentation/widgets/category_header_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HotelFacilitiesView extends StatelessWidget {
  const HotelFacilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CategoryHeaderView(title: 'Hotel Facilities'),
     14.verticalSpace,
      SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child:Row(children: List.generate(5, (index) =>FacilityItem()

        ),
       ),
     ),
    ]);
  }
}
