import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/favorite/components/listis_favorite_view.dart';
import 'package:qfly/presentation/screens/favorite/components/recently_view.dart';
class FavoriteBodyView extends StatelessWidget {
  const FavoriteBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
     RecentlyView(),
          24.verticalSpace,
          Expanded(
              child: ListsFavoriteView())


        ],
      ),
    );
  }
}
