import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/payment/components/card_item_view.dart';
import 'package:qfly/presentation/screens/payment/components/cvv_note_view.dart';
class CardPaymentView extends StatelessWidget {
  const CardPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
Text('Card Payment',style: TextStylesManager.mediumStyle(fontSize: 18.sp),),
        8.verticalSpace,
        Text('Enter your card details to continue payment process',style: TextStylesManager.regularStyle(fontSize: 12.sp,color: grey),),
        14.verticalSpace,
        CardItemView(title: 'Card Number'),
        8.verticalSpace,
        CardItemView(title: 'Card holding name'),
        8.verticalSpace,
        CardItemView(title: 'Cvv No.'),
        5.verticalSpace,
        CvvNoteView()



      ],
    );
  }
}
