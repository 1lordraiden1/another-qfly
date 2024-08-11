import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';

import '../../../../constant/assets_manager.dart';
import '../../../../constant/colors.dart';
import '../../../widgets/text_field_shapes/text_field_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhereToTripView extends StatelessWidget {
  HomeCubit? homeCubit;
  String text;
  String icon;
  bool isHotel;

  WhereToTripView({
    super.key,
    this.text = 'Where To?',
    this.icon = ImageAssets.flightTripIcon,
    this.homeCubit,
    this.isHotel = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, snapshot) {
      return Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r)),
          border: Border.all(color: lightGray, width: 1.w),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    });
  }
}
