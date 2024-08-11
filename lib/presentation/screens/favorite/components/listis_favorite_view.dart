import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/favorite/components/list_favorite_item_view.dart';
class ListsFavoriteView extends StatelessWidget {
  const ListsFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lists',style: TextStylesManager.mediumStyle(fontSize:20.sp ),),
        10.verticalSpace,
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: 4,
              itemBuilder: (

              BuildContext context,int index){
            return ListFavoriteItemView();
          }),
        )

      ],
    );
  }
}
