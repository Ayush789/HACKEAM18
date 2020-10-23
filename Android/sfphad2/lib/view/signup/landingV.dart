import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfphad/common/BottomButton.dart';
import 'package:sfphad/common/VerticalDoubleS.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/view/signup/login/loginV.dart';
import 'package:sfphad/view/signup/signup/signupV.dart';

class LandingV extends StatefulWidget {
  @override
  _LandingVState createState() => _LandingVState();
}

class _LandingVState extends State<LandingV>
    with SingleTickerProviderStateMixin {
  TextEditingController signInUsernameController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          if (details.delta.dy < 0 && animationController.value == 0) expand();
          if (details.delta.dy > 0 && animationController.value == 1)
            contract();
        },
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: height,
                  width: width,
                ),
                Positioned(
                  top: (0 + (-height * 7 / 10 - 0) * animationController.value),
                  width: width,
                  child: VerticalDoubleS(
                    height: height,
                    h: height * 0.1,
                    w: height * 0.1,
                    bottomColor: baseColor,
                    topColor: Colors.white,
                    x1: height * 4 / 10,
                    x2: height * 9 / 10,
                  ),
                ),
                Positioned(
                  top: (0 + (-height * 3 / 10 - 0) * animationController.value),
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/SignIn.png",
                      height: height * 4 / 10,
                    ),
                  ),
                ),
                Positioned(
                  top: (height * 4 / 10 +
                      (0 - height * 4 / 10) * animationController.value),
                  width: width,
                  child: Opacity(
                    opacity: (1 - animationController.value),
                    child: LoginV(),
                  ),
                ),
                Positioned(
                  top: (height * 9 / 10 +
                      (height * 1 / 10 - height * 9 / 10) *
                          animationController.value),
                  height: (height * 1 / 10),
                  width: width,
                  child: FlatButton(
                    onPressed: () {
                      expand();
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28,
                        color: animationController.value == 0
                            ? baseColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (height +
                      (height * 3 / 10 - height) * animationController.value),
                  width: width,
                  child: Opacity(
                    opacity: animationController.value,
                    child: animationController.value != 0
                        ? SignUpV()
                        : Container(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                    opacity: animationController.value,
                    child: Column(
                      children: <Widget>[
                        if (animationController.value != 0)
                          Row(
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  contract();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: buttonColor, fontSize: 17),
                                ),
                              ),
                              BottomButton(
                                height: height * 1 / 10,
                                width: width * 5 / 10,
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/onboarding1');
                                },
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void expand() {
    animationController.animateTo(1);
  }

  void contract() {
    animationController.animateTo(0);
  }
}
