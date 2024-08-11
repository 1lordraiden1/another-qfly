import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/hotels/components/filter_results_view.dart';

import '../../../../constant/text_styles_manager.dart';
import 'filter_item_result.dart';
import 'hotel_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectHotelBody extends StatelessWidget {
  const SelectHotelBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.verticalSpace,
          FilterResultsView(),
          10.verticalSpace,
          Text('All Hotels(12)',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
         10.verticalSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (BuildContext context,int index){
                return HotelView();
              },),
          ),
        ],
      ),
    );
  }
}
