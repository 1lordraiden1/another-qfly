import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/onboard/onboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/onboard/components/pageview_indicators_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../config/routes/app_routes.dart';

class OnBoardDataView extends StatelessWidget {
  OnBoardDataView({
    super.key,
  });
  late OnBoardCubit _onBoardCubit;
  @override
  Widget build(BuildContext context) {
    _onBoardCubit = context.read<OnBoardCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            70.verticalSpace,
            Center(
                child: Text(
              _onBoardCubit.onboardTitles[_onBoardCubit.pageIndex],
              style: TextStylesManager.semiBoldStyle(fontSize: 30.sp),
              textAlign: TextAlign.center,
            )),
            16.verticalSpace,
            Text(
              'Find the best property for you want they made simple and clean',
              style:
                  TextStylesManager.regularStyle(fontSize: 18.sp, color: grey),
              textAlign: TextAlign.center,
            ),
            80.verticalSpace,
            PageViewIndicatorsView(),
            58.verticalSpace,
            if (_onBoardCubit.pageIndex == 2) ...[
              RoundedBtn(
                title: 'Login',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginRoute, (route) => false),
                color: primaryColor,
                width: context.width,
                height: 60.h,
              ),
              8.verticalSpace,
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginRoute, (route) => false),
                child: Text(
                  'Skip',
                  style: TextStylesManager.regularStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
