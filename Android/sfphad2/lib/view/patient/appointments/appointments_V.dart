import 'package:flutter/material.dart';
import 'package:rounded_flutter_datetime_picker/rounded_flutter_datetime_picker.dart';
import 'package:sfphad/common/BottomS.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/view/patient/Appointments/appointment_box.dart';
import 'package:sfphad/view/patient/Appointments/appointments_VM.dart';
import 'package:stacked/stacked.dart';

class Appointments_V extends StatefulWidget {
  @override
  _Appointments_VState createState() => _Appointments_VState();
}

class _Appointments_VState extends State<Appointments_V> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<Appointments_VM>.reactive(
      builder: (context, model, child) {
        return Stack(
          children: [
            ListView(
              children: [
                Appointment_Box(
                  date: DateTime.now(),
                  done: true,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
                Appointment_Box(
                  date: DateTime.now(),
                  done: false,
                ),
              ],
            ),
            Positioned(
              bottom: -40,
              right: 0,
              child: Stack(
                children: [
                  BottomS(
                    height: height * 0.3,
                    width: width,
                    topColor: baseColor,
                    w: height * 0.1,
                  ),
                  Positioned(
                    top: height * 0.18,
                    left: 0,
                    child: Container(
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: () async {
                              DateTime date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2021),
                              );
                              TimeOfDay time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              print(date);
                              print(time);
                            },
                            child: Text(
                              "Schedule Appointment",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      viewModelBuilder: () => Appointments_VM(),
    );
  }
}
