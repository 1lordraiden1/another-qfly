import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_hotel_children.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_travelers_view.dart';
import 'package:qfly/presentation/widgets/bottom_sheet.dart';
import 'icons/add_icon_view.dart';

class UsersNumPeopleView extends StatelessWidget {
  HomeCubit homeCubit;
  RoomData room;
  UsersNumPeopleView({
    super.key,
    required this.title,
    required this.iconPath,
    required this.homeCubit,
    required this.room,
  });
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: homeCubit,
      listener: (context, state) {},
      builder: (context, snapshot) {
        bool isAdult = title == 'Adult';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Text(
              title,
              style: TextStylesManager.mediumStyle(fontSize: 16.sp),
            ), */
            10.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGray),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      child: AddIconView(
                        borderColor: isAdult
                            ? room.adults > 1
                                ? null
                                : grey
                            : room.children > 0
                                ? null
                                : grey,
                        icon: Icons.minimize,
                      ),
                      onTap: () {
                        isAdult
                            ? homeCubit.handleAdultsChanges(room, '-')
                            : {
                                homeCubit.handleChildrenChanges(room, '-'),
                                homeCubit.handleHotelChildSelection(
                                    //
                                    room,
                                    room.children),
                              };
                      },
                    ),
                  ),
                  14.horizontalSpace,
                  Text(
                    isAdult ? room.adults.toString() : room.children.toString(),
                    style: TextStylesManager.regularStyle(fontSize: 16.sp),
                  ),
                  6.horizontalSpace,
                  SvgPicture.asset(
                    iconPath,
                    width: 15,
                    height: 17,
                  ),
                  14.horizontalSpace,
                  Flexible(
                      child: GestureDetector(
                    child: AddIconView(
                      borderColor: isAdult
                          ? room.adults < 5
                              ? null
                              : grey
                          : room.children < 5
                              ? null
                              : grey,
                    ),
                    onTap: () {
                      isAdult
                          ? homeCubit.handleAdultsChanges(room, '+')
                          : {
                              homeCubit.handleChildrenChanges(room, '+'),
                              homeCubit.handleHotelChildSelection(
                                  //
                                  room,
                                  room.children),
                            };

                      if (!isAdult) {
                        room.children > 0
                            ? BottomSheetShape(
                                FilterHotelView(
                                  homeCubit: homeCubit,
                                  room: room,
                                ),
                              ).build(context)
                            : Navigator.pop(context);
                      }
                    },
                  )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
