import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/text_styles_manager.dart';
class ServiceItemView extends StatelessWidget {
   ServiceItemView({super.key, required this.serviceIndex, required this.title, required this.iconPath});
final int serviceIndex;
final String title;
final String iconPath;
late HomeCubit _homeCubit;
  @override
  Widget build(BuildContext context) {
    _homeCubit=context.read<HomeCubit>();
    return InkWell(
      onTap:() =>_homeCubit.selectService(serviceIndex,context),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            decoration: BoxDecoration(
              color:serviceIndex==_homeCubit.serviceIndex?primaryColor:lightGray ,
              shape: BoxShape.circle
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 25.h),

            child:SvgPicture.asset(iconPath,color:serviceIndex==_homeCubit.serviceIndex? white:grey,width: 30.w,height: 35.h,) ,
            ),
          ),
          8.verticalSpace,
          Text(title,style: TextStylesManager.mediumStyle(fontSize: 12.sp),)
        ],
      ),
    );
  }
}
