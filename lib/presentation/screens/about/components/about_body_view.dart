import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/about/components/about_item_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AboutBodyView extends StatelessWidget {
  const AboutBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int index){
            return AboutItemView();

      }),
    );
  }
}
