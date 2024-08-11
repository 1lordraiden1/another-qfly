import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/home/components/where_from/popular_view.dart';
import 'package:qfly/presentation/widgets/title_header_view.dart';
import 'package:qfly/utils/media_query_values.dart';
class WhereFromView extends StatelessWidget {
  const WhereFromView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height/2,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleHeaderView(title: 'Where From?',),
            30.verticalSpace,
            Expanded(child: PopularOriginView())


          ],
        ),
      ),
    );
  }
}
