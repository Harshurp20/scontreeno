import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double HEIGHT_SUBSTRACT = 20.0;
const int SPIKES_NUMBER = 10;

class RecepitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
    double wA = size.width / (2 * SPIKES_NUMBER);

    Path path = new Path();
    path.lineTo(0, size.height);
    print("heigth:" + size.height.toString());

    for (int i = 0; i < SPIKES_NUMBER * 2; i++) {
      if (i % 2 != 0)
        path.lineTo(i * wA, size.height - HEIGHT_SUBSTRACT);
      else
        path.lineTo(i * wA, size.height);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.black26, 6.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RecepitPainter oldDelegate) {
    if (oldDelegate != this)
      return true;
    else
      return false;
  }
}
