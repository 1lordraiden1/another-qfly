import 'package:flutter/material.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/favorite/components/favorite_list_item_view.dart';
import 'package:qfly/presentation/screens/favorite/components/recently_item_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavoriteItemsScreen extends StatelessWidget {
  const FavoriteItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarView(title: 'Favorite'),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cairo best places',style: TextStylesManager.mediumStyle(fontSize: 18.sp),),
16.verticalSpace,
                  Expanded(
                    child: GridView.builder(
padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,


                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.w),
                      itemBuilder: (_, index) => FavoriteListItemView(),
                      itemCount: 8,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
