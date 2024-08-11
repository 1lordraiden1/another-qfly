import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';

import '../../../../config/routes/app_routes.dart';
class ListFavoriteItemView extends StatelessWidget {
  const ListFavoriteItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, Routes.favoriteItemsRoute),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cairo best places',style: TextStylesManager.mediumStyle(fontSize: 16.sp),),
              Icon(Icons.more_vert)
            ],
          ),
          8.verticalSpace,
          TextWithIconView(iconPath: ImageAssets.favoriteIcon, text: '7 Properties',textStyle: TextStylesManager.regularStyle(fontSize: 12.sp,color: grey),)
,10.verticalSpace,
          Divider()
        ],
      ),
    );
  }
}
