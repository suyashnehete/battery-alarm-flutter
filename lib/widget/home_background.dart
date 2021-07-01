import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(
        size.width / 2, size.height / 0.87, size.width, size.height * 1);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
