import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/login/components/sso_item_view.dart';
import 'package:qfly/utils/media_query_values.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../constant/assets_manager.dart';
import '../../../../constant/colors.dart';
import '../../../widgets/btn_shapes/rounded_btn_view.dart';
import 'or_view.dart';

class LoginOptionsView extends StatelessWidget {
  const LoginOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      60.verticalSpace,
      RoundedBtn(
        title: 'Login',
        onTap: () => Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainRoute, (route) => false),
        color: primaryColor,
        width: context.width,
        height: 60.h,
      ),
      58.verticalSpace,
      OrView(),
      42.verticalSpace,
      SsoItemView(
        iconPath: ImageAssets.fbIcon,
        title: 'continue with facebook',
      ),
      24.verticalSpace,
      SsoItemView(
        iconPath: ImageAssets.googleIcon,
        title: 'continue with google',
      ),
    ]);
  }
}
