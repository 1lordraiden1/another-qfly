import 'package:flutter/material.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_arrow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HotelPoliciesView extends StatelessWidget {
  const HotelPoliciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWithArrow(),
        9.verticalSpace,

        Divider(),
        TextWithArrow(),
        9.verticalSpace,

        Divider(),

        TextWithArrow(),
        9.verticalSpace,

        Divider(),

        TextWithArrow(),
      ],
    );
  }
}
