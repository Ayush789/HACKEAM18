import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalDoubleS extends StatelessWidget {
  double height;
  double h, w, x1, x2;
  Color topColor, bottomColor;

  VerticalDoubleS({
    this.height,
    this.h,
    this.w,
    this.x1,
    this.x2,
    this.topColor,
    this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: height,
        width: double.infinity,
      ),
      painter: VerticalSShape(h, w, x1, x2, topColor, bottomColor),
    );
  }
}

class VerticalSShape extends CustomPainter {
  double h, w, x1, x2;
  Color topColor, bottomColor;

  VerticalSShape(
    this.h,
    this.w,
    this.x1,
    this.x2,
    this.topColor,
    this.bottomColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;

    Paint paint = Paint();
    paint.color = topColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    paint.color = bottomColor;
    paint.style = PaintingStyle.fill;
    Path path = Path();

    path.moveTo(0, x1 - h);
    path.quadraticBezierTo(0, x1, w, x1);
    path.lineTo(width - w, x1);
    path.quadraticBezierTo(width, x1, width, x1 + h);
    path.lineTo(width, x2 + h);
    path.quadraticBezierTo(width, x2, width - w, x2);
    path.lineTo(w, x2);
    path.quadraticBezierTo(0, x2, 0, x2 - h);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
