import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/text_field_view.dart';
import '../../../constant/colors.dart';
class TextFieldWithBorder extends StatelessWidget {
  const TextFieldWithBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
        decoration: BoxDecoration(
        color: veryLightGray.withOpacity(0.5),
    borderRadius: BorderRadius.circular(30.r),

    ),
    child: TextFieldRectangle(hint: '', controller: TextEditingController() ),
    );
  }
}
