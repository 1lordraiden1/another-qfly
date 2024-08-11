import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../constant/text_styles_manager.dart';
import '../../../widgets/text_shapes/text_input_view.dart';
class LoginInputsView extends StatelessWidget {
  const LoginInputsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputView(label: 'Name',iconPath: ImageAssets.emailIcon,),
        24.verticalSpace,
        TextInputView(label: 'Mobile Number',iconPath: ImageAssets.phoneIcon),
        20.verticalSpace,
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
              onTap:()=> Navigator.pushNamed(context, Routes.forgetPassRoute),
              child: Text('Forget Password?',style: TextStylesManager.mediumUnderLineStyle(fontSize: 16.sp,),)),
        ),



      ],
    );
  }
}
