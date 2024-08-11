import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NotificationItemView extends StatelessWidget {
  const NotificationItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'
              ,style: TextStylesManager.mediumStyle(fontSize: 12.sp),maxLines: 1,),
            ),
            Flexible(child: Icon(Icons.more_vert,color: primaryColor,))
          ],
        ),
        8.verticalSpace,
        Text('11/9/2023',style: TextStylesManager.mediumStyle(fontSize: 10.sp,color: primaryColor),)
,12.verticalSpace,
        Divider(),
        12.verticalSpace,
      ],
    );
  }
}
