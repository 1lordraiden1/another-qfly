import 'package:flutter/material.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/screens/display_images/components/image_indicator_rotation_view.dart';
import 'package:qfly/presentation/widgets/app_bar/simple_app_bar_view.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:imageview360/imageview360.dart';
import 'package:qfly/utils/media_query_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DisplayImagesScreen extends StatefulWidget {
   DisplayImagesScreen({super.key});

  @override
  State<DisplayImagesScreen> createState() => _DisplayImagesScreenState();
}

class _DisplayImagesScreenState extends State<DisplayImagesScreen> {
   List<String>images=['https://media.istockphoto.com/id/1222623844/photo/master-bedroom-in-new-luxury-home-with-chandelier-and-large-bank-of-windows-with-view-of-trees.jpg?s=2048x2048&w=is&k=20&c=7ihMopQdAob0ZEz5HIztHruElRrktcfJJ_VI1KN-nlg=',
     'https://media.istockphoto.com/id/1222623857/photo/master-bedroom-in-new-luxury-home-with-chandelier-and-view-of-bathroom.jpg?s=2048x2048&w=is&k=20&c=OXG0We3kFdGQQ5HupLbKmZ0X2XRVIP2eFy7OOJv_1pE='];


   int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


            SizedBox(
              height: context.height,
              child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Swipe check,if allowed than only will image move
                      if (details.delta.dx > 0) {
                        index=0;
                      } else if (details.delta.dx < 0) {
                        index=1;
                      }
                      setState(() {

                      });
                    },

                  child: FancyImageShape(imagePath: images[index])),
            ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: SimpleAppBarView(title: 'Bedroom'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ImageIndicatorRotationView(imagePath: index==0?ImageAssets.firstSpecsImg:ImageAssets.secondSpecsImg,),
          )


        ],
      ),
    );
  }
}
