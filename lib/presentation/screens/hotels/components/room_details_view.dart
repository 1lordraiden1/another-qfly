import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_with_icon.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';

class RoomDetailsView extends StatelessWidget {
  const RoomDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style:
                    TextStylesManager.regularStyle(fontSize: 9.sp, color: grey),
              ),
              Row(
                children: [
                  Text(
                    '\$ 20',
                    style: TextStylesManager.mediumStyle(
                        fontSize: 12.sp, color: primaryColor),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '/pernight',
                          style: TextStylesManager.regularStyle(
                              fontSize: 9.sp, color: grey),
                        ),
                        Text(
                          'Hotel room : 2 beds',
                          style: TextStylesManager.mediumStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                        5.horizontalSpace
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Flexible(
            child: RoundedBtnWithIcon(
          title: 'Book',
          onTap: () {},
        ))
      ],
    );
  }
}
