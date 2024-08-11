import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/screens/splash/components/lets_tour_view.dart';
import '../../../config/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
 Navigator.pushNamedAndRemoveUntil(context, Routes.onBoardRoute, (route) => false);

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.splashBgImg),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const  Align(
                  alignment: Alignment.topLeft,
                  child: LetsTourView()),
              310.verticalSpace,
              Center(child:SvgPicture.asset(ImageAssets.logoSplashIcon,width: 112.w,height: 112.h,)),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImageAssets.poweredByLogoIcon,height: 85.h,width: 92.w,),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
