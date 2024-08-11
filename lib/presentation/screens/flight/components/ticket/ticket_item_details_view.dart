import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketItemDetailsView extends StatelessWidget {
  const TicketItemDetailsView(
      {super.key,
      required this.homeCubit,
      required this.title,
      required this.time});

  final HomeCubit homeCubit;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Image.asset(ImageAssets.ticketAirportIcon),
        Text(
          title, //'CAI',
          style: TextStylesManager.mediumStyle(fontSize: 16.sp),
        ),
        Text(
          time.substring(0, 10),
          style: TextStylesManager.regularStyle(fontSize: 12.sp),
        ),
        Text(
          time.substring(10, 19),
          style: TextStylesManager.regularStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}
