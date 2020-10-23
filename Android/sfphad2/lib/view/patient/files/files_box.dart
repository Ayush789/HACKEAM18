import 'package:flutter/material.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/common/padding.dart';

class FilesBox extends StatelessWidget {
  String caption;
  Image image;

  FilesBox({
    @required this.caption,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: height * 0.25,
        width: width * 0.6,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: width * 0.4,
              height: height * 0.17,
              child: image,
            ),
            Text(
              caption,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
