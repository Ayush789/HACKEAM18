import 'package:flutter/material.dart';
import 'package:sfphad/common/colors.dart';

class PatientButton extends StatelessWidget {
  DateTime time;
  bool done;
  String name, id;

  PatientButton({
    @required this.name,
    @required this.id,
    @required this.time,
    @required this.done,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/patient');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 1 / 20,
              child: Icon(
                done ? Icons.check : Icons.fiber_manual_record,
                color: Colors.white,
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
                    Container(
                      height: 55,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: baseColor,
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 3.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${time.hour}:${time.minute}",
                            style: TextStyle(fontSize: 21),
                          ),
                          Text("${time.hour > 12 ? "PM" : "AM"}")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            id,
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
      ),
    );
  }
}
