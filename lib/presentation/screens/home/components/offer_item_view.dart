import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/presentation/screens/home/components/offer_item_details_view.dart';

import '../../../../constant/colors.dart';
class OfferItemView extends StatelessWidget {
  const OfferItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,


      child: Card(
        margin: EdgeInsets.only(right: 10.w),
        color: white,
        elevation: 3,




        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 164.h,
                width: 180.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image:const DecorationImage(
                        image: AssetImage(ImageAssets.flightImg),
                        fit: BoxFit.fill
                    )
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 10.h,left: 12.w),
                      child:  SvgPicture.asset(ImageAssets.offerIcon),
                    ))
            ),
 OfferItemDetailsView(),

          ],
        ),
      ),
    );
  }
}
