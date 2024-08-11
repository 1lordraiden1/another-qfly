import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant/colors.dart';
class RoomFacilitiesView extends StatelessWidget {
  const RoomFacilitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 6.h,


      direction: Axis.horizontal,
      children: List.generate(6, (index) => FittedBox(fit: BoxFit.scaleDown,
        child: TextWithIconView(iconPath: ImageAssets.cinemaIcon, text: 'Flat Screen Tv',textStyle: TextStylesManager.mediumStyle(fontSize: 10.sp,color: red),),
      )),
    );
  }
}
