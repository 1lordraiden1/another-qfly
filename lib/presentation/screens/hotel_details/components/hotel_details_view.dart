import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_desc_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_facilities_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_policies_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_with_icon.dart';
import 'package:qfly/presentation/widgets/container_border_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        30.verticalSpace,
        ContainerBorderView(),
        16.verticalSpace,
      HotelFacilitiesView(),
        HotelDescView(),
        HotelPoliciesView(),
        30.verticalSpace,
        SizedBox(
            height: 50.h,
            child: RoundedBtnWithIcon(title: 'Book', onTap: (){},style: TextStylesManager.mediumStyle(fontSize: 18.sp,color: white),)),
        22.verticalSpace

      ],
    );
  }
}
