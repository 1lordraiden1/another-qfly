import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';

import '../../../../constant/assets_manager.dart';
import '../../../../constant/colors.dart';
import '../../../widgets/text_field_shapes/text_field_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhereFromTripView extends StatefulWidget {
  String text = "Where From?";
  String icon;
  WhereFromTripView({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  State<WhereFromTripView> createState() => _WhereFromTripViewState();
}

class _WhereFromTripViewState extends State<WhereFromTripView> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeCubit = context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
              border: Border.all(color: lightGray, width: 1.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(widget.icon),
              Expanded(
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
