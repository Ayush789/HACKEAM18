import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfphad/common/BottomS.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/common/padding.dart';
import 'package:sfphad/view/patient/Appointments/appointments_V.dart';
import 'package:sfphad/view/patient/details/details_V.dart';
import 'package:sfphad/view/patient/files/files_V.dart';
import 'package:sfphad/view/patient/patient_VM.dart';
import 'package:stacked/stacked.dart';

class PatientV extends StatefulWidget {
  @override
  _PatientVState createState() => _PatientVState();
}

class _PatientVState extends State<PatientV> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PatientVM>.reactive(
      builder: (context, model, child) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        print(tabController.index);
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: baseColor,
            body: SingleChildScrollView(
                child: Stack(
              children: [
                BottomS(
                  height: height,
                  width: width,
                  x1: height * 0.05,
                  x2: height * 0.30,
                  x: height * 0.20,
                  w: height * 0.10,
                  topColor: Colors.white,
                  bottomColor: baseColor,
                ),
                Positioned(
                  top: height * 0.07,
                  left: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jennifer King",
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      VPadding(19),
                      Text(
                        "ER456",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.77,
                    width: width,
                    // padding: EdgeInsets.all(10),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Details_V(),
                        Appointments_V(),
                        Files_V(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.18,
                  left: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 1 / 20),
                        child: Container(
                          height: 48,
                          width: width * 9 / 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 2.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TabBar(
                              controller: tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: baseColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.blue,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelPadding: EdgeInsets.zero,
                              tabs: [
                                Tab(text: "Details"),
                                Tab(text: "Appointemnts"),
                                Tab(text: "Files"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        );
      },
      viewModelBuilder: () => PatientVM(),
    );
  }
}
