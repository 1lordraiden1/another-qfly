import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TitleHeaderView extends StatelessWidget {
  const TitleHeaderView({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStylesManager.semiBoldStyle(fontSize:22.sp ),),
        InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.close,color: grey,))
      ],
    );
  }
}
