import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/main/main_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
            color: grey,
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(-4, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          unselectedFontSize: 11.sp,// not used in the prev version  by Z
            selectedFontSize: 11.sp,
            selectedItemColor: primaryColor,
            //selectedLabelStyle: TextStylesManager.semiBoldStyle(fontSize: 11.sp),
            currentIndex: context.read<MainCubit>().pageIndex,
            onTap: (int index) {
              context.read<MainCubit>().changePage(index);
              _currentIndex = index;
              setState(() {});
            },
            elevation: 10,
            //elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: SvgPicture.asset(
                    ImageAssets.homeIcon,
                    color: _currentIndex == 0 ? primaryColor : grey,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SvgPicture.asset(ImageAssets.myTripsIcon,
                        color: _currentIndex == 1 ? primaryColor : grey)),
                label: 'My Trips',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SvgPicture.asset(ImageAssets.notificationIcon,
                        color: _currentIndex == 2 ? primaryColor : grey)),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: SvgPicture.asset(ImageAssets.userIcon,
                      color: _currentIndex == 3 ? primaryColor : grey),
                ),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
