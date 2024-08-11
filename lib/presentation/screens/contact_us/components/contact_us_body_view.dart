import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/contact_us/components/contact_us_item_view.dart';
class ContactUsBodyView extends StatelessWidget {
  const ContactUsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int index){
        return ContactUsItemView();
      }),
    );
  }
}
