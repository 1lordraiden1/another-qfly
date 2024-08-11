import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/utils/media_query_values.dart';

class CustomAppBarView extends StatelessWidget {
  const CustomAppBarView({super.key, required this.title, this.canPop = true});
  final String title;
  final bool? canPop;
  @override
  void _showMyPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Congratulations!"),
        content: Column(
          children: [
            Image.asset(ImageAssets.currencyIcon),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60.h, left: 5.w),
                height: 143.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30.r))),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      canPop!
                          ? Navigator.pop(context)
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                showCloseIcon: true,
                                duration: Duration(milliseconds: 3000),
                                content: Text(
                                  "Can't get out of this screen, unless ticket will be lost",
                                ),
                              ),
                            );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: SizedBox(
                      width: context.width,
                      child: Center(
                        child: Text(
                          title,
                          style: TextStylesManager.mediumStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
