import 'package:doctor_app/consts/colors.dart';
import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var rect =Offset.zero&size;
    Paint paint=Paint();
    Path path=Path();
    paint.shader= LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors:[
          green,
          babyBlue,
          green

        ]
    ).createShader(rect);
    path.lineTo(2,size.height - size.height/10);
    path.conicTo(size.width/10, size.height, size.width, size.height-size.height/5,5);
    path.lineTo(size.width,5);
    canvas.drawShadow(path,green, 5, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}