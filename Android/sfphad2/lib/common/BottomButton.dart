import 'package:flutter/material.dart';

import 'colors.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key key,
    @required this.height,
    @required this.width,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(height)),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
