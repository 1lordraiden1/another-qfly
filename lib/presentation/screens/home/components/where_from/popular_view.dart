import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/home/components/where_from/popular_origin_item_view.dart';
class PopularOriginView extends StatelessWidget {
  const PopularOriginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Popular Origins',style: TextStylesManager.regularStyle(fontSize: 14.sp,color: grey),),
        15.verticalSpace,
        Divider(),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context,int index){
            return PopularOriginItemView();
          }),
        ),
      ],
    );
  }
}
