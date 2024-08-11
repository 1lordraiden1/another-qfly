import 'package:flutter/material.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/favorite/components/recently_item_view.dart';
class RecentlyView extends StatelessWidget {
  const RecentlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recently Saved',style: TextStylesManager.mediumStyle(fontSize: 18.sp),),
        14.verticalSpace,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) => RecentlyItemView()),
            ),
          ),



      ],
    );
  }
}
