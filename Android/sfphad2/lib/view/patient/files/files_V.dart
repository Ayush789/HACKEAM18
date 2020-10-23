import 'package:flutter/material.dart';
import 'package:sfphad/view/patient/files/files_VM.dart';
import 'package:sfphad/view/patient/files/files_box.dart';
import 'package:stacked/stacked.dart';

class Files_V extends StatefulWidget {
  @override
  _Files_VState createState() => _Files_VState();
}

class _Files_VState extends State<Files_V> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Files_VM>.reactive(
        builder: (context, model, child) {
          return ListView(
            children: [
              Column(
                children: [
                  FilesBox(
                    caption: "Malaria",
                    image: Image.asset(
                      "assets/images/report.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  FilesBox(
                    caption: "Malaria",
                    image: Image.asset(
                      "assets/images/report.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  FilesBox(
                    caption: "Malaria",
                    image: Image.asset(
                      "assets/images/report.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  FilesBox(
                    caption: "Malaria",
                    image: Image.asset(
                      "assets/images/report.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        viewModelBuilder: () => Files_VM());
  }
}
