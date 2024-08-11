import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterTicketView extends StatelessWidget {
  const FooterTicketView({
    super.key,
    required this.homeCubit,
    required this.totalPrice,
    required this.seats,
    required this.numOfBags,
  });

  final HomeCubit homeCubit;

  final String totalPrice;
  final String seats;
  final String numOfBags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            totalPrice,
            style: TextStylesManager.semiBoldStyle(fontSize: 12.sp),
          ),
          Row(
            children: [
              Text(
                'Flight No. $seats ',
                style:
                    TextStylesManager.regularStyle(fontSize: 10.sp, color: red),
              ),
              8.horizontalSpace,
              Text(
                numOfBags,
                style: TextStylesManager.regularStyle(
                    fontSize: 12.sp, color: primaryColor),
              ),
              SvgPicture.asset(ImageAssets.bagIcon)
            ],
          )
        ],
      ),
    );
  }
}
