import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/filter_option_view.dart';
import 'package:qfly/presentation/screens/home/components/filter_view/header_filter_view.dart';
import 'package:qfly/presentation/widgets/radio_group_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

class FilterHotelView extends StatelessWidget {
  HomeCubit homeCubit;
  RoomData room;

  FilterHotelView({
    super.key,
    required this.homeCubit,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, snapshot) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderFilterView(
            title: 'Room ${room.id}',
          ), // FilterOptionView(room: room,title: 'Child ${room.children}',limit: ' 2 <  11 ',),
          ListView.separated(
            padding: EdgeInsets.all(10),
            shrinkWrap: true, //
            itemBuilder: (context, index) {
              return FilterOptionView(
                homeCubit: homeCubit,
                child: room.childs[index],
                title: 'Child ${room.children}',
                limit: ' 2 <  11 ',
              );
            },
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: room.children,
          ),
          10.verticalSpace,
          RoundedBtn(
            title: 'Done',
            onTap: () => Navigator.pop(context),
          ),
          20.verticalSpace
        ],
      );
    });
  }
}
