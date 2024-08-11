import 'package:flutter/material.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/text_field_view.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/text_field_with_border.dart';
import 'package:qfly/utils/media_query_values.dart';
class CardItemView extends StatelessWidget {
  const CardItemView({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(title,style: TextStylesManager.mediumStyle(fontSize: 12.sp),))),
6.horizontalSpace,
          Expanded(
              flex: 5,
              child: TextFieldWithBorder())

        ],
      ),
    );
  }
}
