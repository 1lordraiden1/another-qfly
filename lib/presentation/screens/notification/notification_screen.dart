import 'package:flutter/material.dart';
import 'package:qfly/presentation/screens/notification/components/notification_item_view.dart';
import 'package:qfly/presentation/widgets/app_bar/simple_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          SimpleAppBarView(title: 'Notification',addBack: false,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(itemBuilder: (BuildContext context,int index){
                return NotificationItemView();
              }),
            ),
          )
        ],

    );
  }
}
