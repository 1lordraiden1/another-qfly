import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/presentation/screens/booking/components/first_part_seat_view.dart';
import 'package:qfly/presentation/screens/booking/components/second_part_seat_view.dart';
import 'package:qfly/presentation/screens/booking/components/selcted_seats_view.dart';
class SeatsView extends StatelessWidget {
  const SeatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.only(left: 24.w,right:24.w,top: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
    border: Border.all(color: white),
    gradient: LinearGradient(
    colors: [
    firstGray,
    secondGray,
    ],

      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      ),
          boxShadow:const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]

    ),
      child:Column(
        children: [
          Row(
            children: [
FirstPartSeatView(),
              Image.asset(ImageAssets.planeArrowIcon),
              SecondPartSeatView()
            ],
          ),
          Divider(color: white,thickness: 2,),
         Center(child: SelectedSeatsView())
        ],
      )

    );
  }
}
