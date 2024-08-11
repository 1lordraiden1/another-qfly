import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/widgets/icon_shapes/icon_with_border.dart';
import '../../../../constant/text_styles_manager.dart';
import '../../../widgets/text_shapes/text_with_border.dart';
class PaymentWaysView extends StatelessWidget {
  const PaymentWaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment',style: TextStylesManager.semiBoldStyle(fontSize: 18.sp),),
12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWithBorder(icon: ImageAssets.visaIcon),
            IconWithBorder(icon: ImageAssets.paypalIcon),
            TextWithBorder(text: 'Cash'),
          ],
        )
      ],
    );
  }
}
