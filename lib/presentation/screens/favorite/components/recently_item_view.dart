import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/screens/favorite/components/favorite_details_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/circle_with_icon_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/favorite_icon_view.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class RecentlyItemView extends StatelessWidget {
  const RecentlyItemView({super.key,  this.height,  this.width});
final double? height;
final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.h,
      child: Padding(
        padding:  EdgeInsets.only(right: 16.w),
        child: Stack(
          children: [
            Stack(
              children: [
                FancyImageShape(imagePath: 'https://366e203a.rocketcdn.me/wp-content/uploads/2020/06/Paris.jpg', radius: BorderRadius.all(Radius.circular(10.r),),height: 140.h,width: 140.w,),
                Align(
                  alignment: Alignment.topRight,
                  child:FavoriteIconView(iconPath: ImageAssets.favoriteIcon,),
                ),
              ],
            )
        ,
           Positioned(
              bottom: 5.h,
                child: FavoriteDetailsView())
        ]
        ),
      ),
    );
  }
}
