import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/presentation/screens/home/airport_screen.dart';
import 'package:qfly/presentation/screens/home/components/countries_screen.dart';
import 'package:qfly/presentation/screens/home/components/where_from_trip_view.dart';
import 'package:qfly/presentation/screens/home/components/where_to_trip_view.dart';
import 'package:qfly/presentation/widgets/bottom_sheet.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/text_field_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/presentation/widgets/text_shapes/box_text_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';

class TripWayView extends StatefulWidget {
  HomeCubit homeCubit;
  TripWayView({
    super.key,
    required this.homeCubit,
  });

  @override
  State<TripWayView> createState() => _TripWayViewState();
}

class _TripWayViewState extends State<TripWayView> {
  @override
  void initState() {
    super.initState(); // handle this to have popular list
  }

  Timer? _throttle;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (builder, state) {
        return Column(
          children: [
            44.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'One Way',
                  style: TextStylesManager.mediumUnderLineStyle(
                      fontSize: 17.sp, color: primaryColor),
                ),
                56.horizontalSpace,
                GestureDetector(
                    child: Text(
                  'Round Trip',
                  style: TextStylesManager.mediumStyle(fontSize: 17.sp),
                )),
              ],
            ),
            14.verticalSpace,
            Stack(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: WhereFromTripView(
                        text: widget.homeCubit.airportFrom.name.isEmpty
                            ? 'Where From?'
                            : widget.homeCubit.airportFrom.name,
                        icon: ImageAssets.flightTripIcon,
                        //icon: widget.homeCubit.iconFrom,
                      ),
                      onTap: () => BottomSheetShape(
                        AirportScreen(
                          title: "Where From?",
                          subtitle: "Enter your origin",
                          homeCubit: widget.homeCubit,
                          isWhereFrom: true,
                        ),
                      ).build(context),
                    ),
                    GestureDetector(
                      child: WhereToTripView(
                        text: widget.homeCubit.airportTo.name.isEmpty
                            ? 'Where To?'
                            : widget.homeCubit.airportTo.name,
                        icon: ImageAssets.flightTripIcon, // to be changed
                      ),
                      onTap: () => BottomSheetShape(
                        AirportScreen(
                          title: "Where To?",
                          subtitle: "Enter your Destination",
                          homeCubit: widget.homeCubit,
                          isWhereFrom: false,
                        ),
                      ).build(context),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => widget.homeCubit.switchAirports(),
                  child: Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(30.sp),
                        child: SvgPicture.asset(
                          ImageAssets.roundTripIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.verticalSpace
          ],
        );
      },
    );
  }
}
