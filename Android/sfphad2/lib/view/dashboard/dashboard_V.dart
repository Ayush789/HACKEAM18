import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfphad/common/BottomButton.dart';
import 'package:sfphad/common/BottomS.dart';
import 'package:sfphad/common/RoundedTextField.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/common/linear_translation.dart';
import 'package:sfphad/common/padding.dart';
import 'package:sfphad/view/dashboard/dashboard_VM.dart';
import 'package:sfphad/view/dashboard/patient_button.dart';
import 'package:stacked/stacked.dart';

class DashboardV extends StatefulWidget {
  @override
  _DashboardVState createState() => _DashboardVState();
}

class _DashboardVState extends State<DashboardV>
    with SingleTickerProviderStateMixin {
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

  void expand() {
    animationController.animateTo(1);
  }

  void contract() {
    animationController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardVM>.reactive(
      builder: (context, model, child) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        print("$height $width");
        return Scaffold(
          backgroundColor: baseColor,
          endDrawer: Drawer(
            child: Container(
              color: baseColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  top: 20,
                  bottom: 20,
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person),
                        ),
                        VPadding(50),
                        ListTile(
                          title: Text(
                            "Patient Database",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          trailing: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        VPadding(20),
                        ListTile(
                          title: Text(
                            "Your Schedule",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          trailing: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                        ),
                        VPadding(20),
                        ListTile(
                          title: Text(
                            "Profile",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          trailing: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        VPadding(20),
                        ListTile(
                          title: Text(
                            "Notifications",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          trailing: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                        VPadding(50),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          color: buttonColorLight,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => SingleChildScrollView(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 1 - animationController.value,
                    child: Container(
                      height: height,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView(
                          padding: EdgeInsets.all(10),
                          children: [
                            VPadding(40),
                            Text(
                              "Welcome,",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            VPadding(20),
                            Row(
                              children: [
                                Text(DateTime.now().day.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 93,
                                    )),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('EEEE').format(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('MMMM, yyyy')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VPadding(40),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                            PatientButton(
                                name: "Jennifer King",
                                id: "ER456",
                                done: false,
                                time: DateTime.now()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: linear_translation(height * (1 - 2 / 10),
                        height * 1 / 10, animationController.value),
                    right: 0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Animating");
                            animationController.value == 0
                                ? expand()
                                : contract();
                          },
                          child: Stack(
                            children: [
                              BottomS(
                                height: height * 2 / 10,
                                width: width,
                                topColor: Colors.white,
                                w: height * 1 / 10,
                              ),
                              Positioned(
                                bottom: linear_translation(height * 1 / 40,
                                    height * 5 / 40, animationController.value),
                                width: width,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Register New Patient",
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: animationController.value == 0
                                            ? baseColor
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: height * 7 / 10,
                          width: width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RoundedTextField(labelText: "Name"),
                                VPadding(20),
                                RoundedTextField(labelText: "Fathers Name"),
                                VPadding(20),
                                RoundedTextField(labelText: "Mothers Name"),
                                VPadding(20),
                                RoundedTextField(labelText: "Phone No"),
                                VPadding(20),
                                RoundedTextField(labelText: "Address"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (animationController.value == 1)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: BottomButton(
                        height: height * 1 / 10,
                        width: width * 5 / 10,
                        onPressed: () {},
                        child: Text(
                          "Register",
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
          ),
        );
      },
      viewModelBuilder: () => DashboardVM(),
    );
  }
}
