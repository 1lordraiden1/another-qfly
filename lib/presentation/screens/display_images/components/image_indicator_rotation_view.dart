import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/constant/assets_manager.dart';

import '../../../../constant/colors.dart';

class ImageIndicatorRotationView extends StatelessWidget {
  const ImageIndicatorRotationView({super.key, required this.imagePath});
final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 35.h),
      child: Image.asset(imagePath,width: 140.w,height: 140.h,)
    );
  }
}
/*Transform.rotate(
  angle: -math.pi / 4,
  child: Text('Text'),
)*/


//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color =Colors.grey.withOpacity(0.6);
    canvas.drawCircle(Offset(size.width*0.3200045,size.height*0.3200045),size.width*0.3200045,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.02740011,0);
    path_1.arcToPoint(Offset(0,size.height*0.02740011),radius: Radius.elliptical(size.width*0.02740011, size.height*0.3),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(0,size.height*0.3014013);
    path_1.arcToPoint(Offset(size.width*0.02740011,size.height*0.3288014),radius: Radius.elliptical(size.width*0.02740011, size.height*0.02740011),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*0.3014013,size.height*0.3288014);
    path_1.arcToPoint(Offset(size.width*0.3288014,size.height*0.3014013),radius: Radius.elliptical(size.width*0.02740011, size.height*0.02740011),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.arcToPoint(Offset(size.width*0.04,0),radius: Radius.elliptical(size.width*0.7, size.height*0.7),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = red;
    canvas.drawPath(path_1,paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = white;
    canvas.drawCircle(Offset(size.width/3,size.height/3),size.width*0.08453175,paint_2_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}