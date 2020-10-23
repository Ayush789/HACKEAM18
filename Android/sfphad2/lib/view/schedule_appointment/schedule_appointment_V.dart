import 'package:flutter/material.dart';
import 'package:sfphad/view/schedule_appointment/schedule_appointment_VM.dart';
import 'package:stacked/stacked.dart';

class ScheduleAppointmentV extends StatefulWidget {
  @override
  _ScheduleAppointmentVState createState() => _ScheduleAppointmentVState();
}

class _ScheduleAppointmentVState extends State<ScheduleAppointmentV> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleAppointmentVM>.reactive(
      builder:
          (BuildContext context, ScheduleAppointmentVM model, Widget child) {
        return Scaffold();
      },
      viewModelBuilder: () => ScheduleAppointmentVM(),
    );
  }
}
