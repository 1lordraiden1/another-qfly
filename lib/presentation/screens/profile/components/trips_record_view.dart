import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/profile/components/profile_item_view.dart';

import '../../../../config/routes/app_routes.dart';
class TripsRecordView extends StatelessWidget {
  const TripsRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trips Records',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
          16.verticalSpace,
          ProfileItemView(title: 'My Reservations',iconPath: ImageAssets.myReservationIcon,),
          ProfileItemView(title: 'Wallet',iconPath: ImageAssets.walletIcon,route: Routes.walletRoute,),
          ProfileItemView(title: 'Favorite',iconPath: ImageAssets.favoriteIcon,route:Routes.favoriteRoute ,),
        ],
      ),
    );
  }
}
