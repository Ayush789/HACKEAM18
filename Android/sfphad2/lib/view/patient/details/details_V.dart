import 'package:flutter/material.dart';
import 'package:sfphad/view/patient/details/details_VM.dart';
import 'package:stacked/stacked.dart';

class Details_V extends StatefulWidget {
  @override
  _Details_VState createState() => _Details_VState();
}

class _Details_VState extends State<Details_V> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Details_VM>.reactive(
        builder: (context, model, child) {
          return Column();
        },
        viewModelBuilder: () => Details_VM());
  }
}
