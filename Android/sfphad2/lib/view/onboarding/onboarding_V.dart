import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfphad/common/BottomButton.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/common/padding.dart';

class Onboarding1V extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/onboarding1.png",
                      height: height * 4 / 10,
                      alignment: Alignment.center,
                    ),
                  ),
                  VPadding(20),
                  Text(
                    "Schedule",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  VPadding(20),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. "),
                  VPadding(40),
                  Center(
                    child: Container(
                      width: width * 4 / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            color: headline2,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: BottomButton(
                height: height * 1 / 10,
                width: width * 5 / 10,
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding2');
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboarding2V extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/onboarding2.png",
                      height: height * 4 / 10,
                      alignment: Alignment.center,
                    ),
                  ),
                  VPadding(20),
                  Text(
                    "Schedule",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  VPadding(20),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. "),
                  VPadding(40),
                  Center(
                    child: Container(
                      width: width * 4 / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: headline2,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: BottomButton(
                height: height * 1 / 10,
                width: width * 5 / 10,
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding3');
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboarding3V extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/onboarding3.png",
                      height: height * 4 / 10,
                      alignment: Alignment.center,
                    ),
                  ),
                  VPadding(20),
                  Text(
                    "Schedule",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  VPadding(20),
                  Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. "),
                  VPadding(40),
                  Center(
                    child: Container(
                      width: width * 4 / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: baseColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: headline2,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: BottomButton(
                height: height * 1 / 10,
                width: width * 5 / 10,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
