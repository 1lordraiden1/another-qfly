import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shimmer/image_loading_shape.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
class FancyImageShape extends StatelessWidget {
  const FancyImageShape({Key? key, required this.imagePath,this.width=double.infinity,  this.height=double.infinity,  this.radius,  this.addSize=false}) : super(key: key);
  final String imagePath;
  final BorderRadius? radius;

  final bool addSize;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {

    return  ClipRRect(


      borderRadius:radius??BorderRadius.all(Radius.zero),

      child: FancyShimmerImage(
        width: width??null!,
        height: height??null!,
        imageUrl: imagePath,
        errorWidget: Image.network('https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
      ),
    );

  }
}
