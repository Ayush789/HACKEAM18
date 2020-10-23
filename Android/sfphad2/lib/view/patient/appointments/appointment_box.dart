import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfphad/common/colors.dart';

class Appointment_Box extends StatelessWidget {
  DateTime date;
  bool done;

  Appointment_Box({
    this.date,
    this.done,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 1 / 20,
            child: Icon(
              done ? Icons.check : Icons.fiber_manual_record,
              color: baseColor,
            ),
          ),
          Container(
            width: width * 7 / 10,
            height: 79,
            decoration: BoxDecoration(
              color: patientButtonColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('dd MMMM, yyyy').format(date),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          DateFormat('jm').format(date),
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
