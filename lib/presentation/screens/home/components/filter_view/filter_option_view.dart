import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/data/model/room/room_models/child_model.dart';
import 'package:qfly/presentation/widgets/icon_shapes/icon_minse_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/icons_plus_view.dart';

class FilterOptionView extends StatelessWidget {
  HomeCubit homeCubit;
  RoomData? room;
  Child? child;
  String title;
  String limit;
  FilterOptionView({
    super.key,
    this.title = 'A',
    this.limit = ' > 12 years',
    this.child,
    this.room,
    required this.homeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          late int operation = 3;
          int data = homeCubit.adults;
          if (child != null) {
            operation = 3;
          }
          if (title == 'Adult' || title == 'Adults') {
            data = homeCubit.adults;
            operation = 0;
          }
          if (title == 'Child' || title == 'Children') {
            data = homeCubit.children;
            operation = 1;
          }
          if (title == 'Infant' || title == 'Infants') {
            data = homeCubit.infant;
            operation = 2;
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child != null
                          ? 'Child ${child!.id.toString()} age'
                          : title,
                      style: TextStylesManager.mediumStyle(fontSize: 18.sp),
                    ),
                    Text(
                      limit,
                      style: TextStylesManager.lightStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: IconMinseView(
                        condition: child != null
                            ? child!.age > 2
                            : operation == 0
                                ? data > 1
                                : data > 0,
                      ),
                      onTap: () {
                        child != null
                            ? homeCubit.handleHotelChildrenChanges(child!, '-')
                            : switch (operation) {
                                0 => homeCubit.handleFlightAdultsChanges(
                                    data, '-'),
                                1 => homeCubit.handleFlightChildrenChanges(
                                    data, '-'),
                                2 => homeCubit.handleFlightInfantChanges(
                                    data, '-'),
                                _ => null,
                              };
                      },
                    ),
                    24.horizontalSpace,
                    Text(
                      child != null ? child!.age.toString() : data.toString(),
                      style: TextStylesManager.mediumStyle(fontSize: 20.sp),
                    ),
                    24.horizontalSpace,
                    GestureDetector(
                      child: IconPlusView(condition: child!=null ? child!.age < 11  :data < 5),
                      onTap: () {
                        child != null
                            ? homeCubit.handleHotelChildrenChanges(child!, '+')
                            : switch (operation) {
                                0 => homeCubit.handleFlightAdultsChanges(
                                    data, '+'),
                                1 => homeCubit.handleFlightChildrenChanges(
                                    data, '+'),
                                _ => homeCubit.handleFlightInfantChanges(
                                    data, '+'),
                              };
                        ;
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
