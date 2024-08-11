import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/config/theme/app_theme.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/home/components/hotel_search/date_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';

class CheckInView extends StatefulWidget {
  HomeCubit homeCubit;
  CheckInView({super.key, required this.homeCubit});

  @override
  State<CheckInView> createState() => _CheckInViewState();
}

class _CheckInViewState extends State<CheckInView> {
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime(2025);

  _showDate1Picker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (value) {
        setState(() {
          date1 = value!;
          widget.homeCubit.handleCheckInDateChanging(value);
        });
      },
    );
  }

  _showDate2Picker() {
    showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: date1,
      lastDate: DateTime(2025),
    ).then(
      (value) {
        setState(() {
          date2 = value!;
          widget.homeCubit.handleCheckInDateChanging(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      listener: (context, state) {},
      builder: (builder, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check in',
              style: TextStylesManager.mediumStyle(fontSize: 16.sp),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: DateView(
                      date: date1,
                    ),
                    onTap: () => _showDate1Picker(),
                  ),
                ),
                SvgPicture.asset(ImageAssets.horizontalRoundTripIcon),
                Expanded(
                  child: GestureDetector(
                    child: DateView(
                      date: date2,
                    ),
                    onTap: () => _showDate2Picker(),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
