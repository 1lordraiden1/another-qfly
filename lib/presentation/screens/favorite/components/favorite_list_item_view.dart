import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/screens/favorite/components/favorite_details_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/favorite_icon_view.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/utils/media_query_values.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FavoriteListItemView extends StatelessWidget {
  const FavoriteListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            FancyImageShape(imagePath: 'https://366e203a.rocketcdn.me/wp-content/uploads/2020/06/Paris.jpg', radius: BorderRadius.all(Radius.circular(10.r),),addSize: true,)
,Align(
  alignment: Alignment.topRight,
  child:FavoriteIconView(iconPath: ImageAssets.favoriteIcon,) ,
)
            ,   Positioned(
                bottom: 12.h,
                child: FavoriteDetailsView(width: context.width/2.5,))
          ]

    );
  }
}
