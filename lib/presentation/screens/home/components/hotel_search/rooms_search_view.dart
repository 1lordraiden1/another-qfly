import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/icons/add_icon_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/icon_minse_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/icons_plus_view.dart';

class RoomsSearchView extends StatelessWidget {
  HomeCubit homeCubit;
  RoomsSearchView({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, snapshot) {
      int rooms = homeCubit.rooms;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rooms',
            style: TextStylesManager.mediumStyle(fontSize: 16.sp),
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 45.w),
            decoration: BoxDecoration(
                border: Border.all(color: lightGray),
                borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    child: AddIconView(
                      borderColor: homeCubit.rooms > 1 ? null : grey,
                      icon: Icons.minimize,
                    ),
                    onTap: () {
                      if (homeCubit.rooms > 1) {
                        homeCubit.handleRoomsChanges(rooms, '-');
                        homeCubit.handleHotelRoomSelection(rooms);
                      }
                    },
                  ),
                ),
                40.horizontalSpace,
                Text(
                  homeCubit.rooms.toString(),
                  style: TextStylesManager.regularStyle(fontSize: 16.sp),
                ),
                40.horizontalSpace,
                Flexible(
                  child: GestureDetector(
                    child: AddIconView(
                      borderColor: homeCubit.rooms < 5 ? null : grey,
                    ),
                    onTap: () {
                      if (homeCubit.rooms < 5) {
                        homeCubit.handleRoomsChanges(rooms, '+');
                        
                        homeCubit.handleHotelRoomSelection(rooms);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
