import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomS extends StatelessWidget {
  double height, width;
  double w, x1, x2, x;
  Color topColor, bottomColor;

  BottomS({
    this.height,
    this.width,
    this.w,
    this.x1,
    this.x2,
    this.x,
    this.topColor,
    this.bottomColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    if (x == null) x = height / 2;
    if (x1 == null) x1 = 0;
    if (x2 == null) x2 = height;
    return CustomPaint(
      child: Container(
        height: height,
        width: width,
      ),
      painter: BottomSShape(w, x, x1, x2, topColor, bottomColor),
    );
  }
}

class BottomSShape extends CustomPainter {
  double w, x, x1, x2;
  Color topColor, bottomColor;

  BottomSShape(
    this.w,
    this.x,
    this.x1,
    this.x2,
    this.topColor,
    this.bottomColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Paint paint = Paint();
    paint.color = bottomColor;
    paint.style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    paint.color = topColor;
    paint.style = PaintingStyle.fill;
    Path path = Path();

    path.moveTo(0, x1);
    path.quadraticBezierTo(0, x, w, x);
    path.lineTo(width - w, x);
    path.quadraticBezierTo(width, x, width, x2);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, x2);
    path.lineTo(0, x1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
