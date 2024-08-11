import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/currency/components/currency_item_view.dart';
class CurrencyBodyView extends StatelessWidget {
  const CurrencyBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(


      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2,
          crossAxisCount: 2,


          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w),
      itemBuilder: (_, index) => CurrencyItemView(),
      itemCount: 8,
    );
  }
}
