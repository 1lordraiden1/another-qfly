import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/profile/components/support_view.dart';
import 'package:qfly/presentation/screens/profile/components/trips_record_view.dart';
import 'package:qfly/presentation/screens/profile/components/user_data_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:qfly/presentation/widgets/app_bar/profile_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAppBarView(title: 'Profile'),
            Center(child: UserDataView()),
            TripsRecordView(),
            SupportView()

          ],
        
      ),
    );
  }
}
