import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/utils/media_query_values.dart';
class ProfileAppBarView extends StatelessWidget {
  const ProfileAppBarView({super.key, required this.title,  this.addBack=false,  this.addEdit=false});
  final String title;
  final bool addBack;
  final bool addEdit;
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60.h,left: 5.w),
                height: 143.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.vertical(bottom:Radius.circular( 30.r))
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child:
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: white)
                        ),
                        child: Icon(Icons.edit_calendar_outlined,color: white,),
                      )

                ),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,right: 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child:  Column(
                children: [
                  Text('Profile',style: TextStylesManager.semiBoldStyle(fontSize: 20.sp,color: white),),
                  12.verticalSpace,
                  Container(
                      height: 90.h,
                      width: 86.w,

                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor,width: 4.w),
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                        )
                      ),
                    ),
                ],
              )
              ),
            ),

        ],

    );
  }
}
