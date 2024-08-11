import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/icon_shapes/back_btn_view.dart';
import '../../../constant/text_styles_manager.dart';
class SimpleAppBarView extends StatelessWidget {
  const SimpleAppBarView({super.key, required this.title,  this.addBack=true});
final String title;
final bool addBack;
  @override
  Widget build(BuildContext context) {
    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        60.verticalSpace,
     if(addBack)   BackBtnView(),
        Center(child: Text(title,style: TextStylesManager.semiBoldStyle(fontSize: 20.sp,),textAlign: TextAlign.center,)),



      ]


    );
  }
}
