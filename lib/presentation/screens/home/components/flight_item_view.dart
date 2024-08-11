import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/home/components/home_header_view.dart';
import 'package:qfly/presentation/widgets/location_details_view.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constant/colors.dart';
class FlightItemView extends StatelessWidget {
  const FlightItemView({super.key, required this.index});
final int  index;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(index.toString()),
    onVisibilityChanged: (VisibilityInfo info) {
    if (info.visibleFraction == 1){context.read<HomeCubit>().changeTopFlightIndex(index);}},
      child: Transform.scale(
        scale:context.read<HomeCubit>().topFlightCurrentItem==index? 1:0.9,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 310.h,
          width: 235.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            image:const DecorationImage(
              image: AssetImage(ImageAssets.flightImg),
              fit: BoxFit.fill
            )
          ),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 17.h,left: 12.w),
                child:  LocationDetailsView(iconPath: ImageAssets.location2Icon,style: TextStylesManager.semiBoldStyle(fontSize: 17.sp,color: white),),
              ))
        ),
      ),
    );
  }
}
