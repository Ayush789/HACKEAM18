import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VPadding extends StatelessWidget {
  double value;

  VPadding(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: value),
    );
  }
}

class HPadding extends StatelessWidget {
  double value;

  HPadding(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: value),
    );
  }
}
