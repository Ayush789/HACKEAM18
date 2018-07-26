import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SFPHAD2',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cont = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SFPHAD"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              child: Image(
            image: AssetImage("Images/original.png"),
            fit: BoxFit.cover,
          )),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    child: TextFormField(
                      controller: cont,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(labelText: "Patient ID",labelStyle: TextStyle(
                        color: Colors.white,
                      )),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.indigo,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Patient(
                                      ID: cont.text,
                                    )));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Patient extends StatefulWidget {
  String ID;
  Patient({this.ID});
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  List<PatientEntry> patients = [
    PatientEntry(
      Name: "Ayush",
      Age: 19.2,
      ID: "AY123",
      LastVisit: "02/02/2018",
    ),
    PatientEntry(
        Name: "Ruchi", Age: 18.6, ID: "RU123", LastVisit: "06/02/2018"),
    PatientEntry(
        Name: "Aadarsh", Age: 19.8, ID: "AD123", LastVisit: "08/02/2018"),
    PatientEntry(
        Name: "Tanvi", Age: 19.6, ID: "TV123", LastVisit: "10/02/2018"),
  ];

  List<Report> reports = [
    Report(
      Date: "03/12/2017",
      Doctor: "Dr. D Shaw",
      Image:Image.network("http://4.bp.blogspot.com/-d7AbvKi3z_c/T5pGDd_KxvI/AAAAAAAABSc/RZXGJd3LDmw/s1600/Dr_Manosh%2BShaha%2B2%2BApril12.jpg"),
    ),
    Report(
      Date: "04/11/2017",
      Doctor: "Dr. Medha Oak",
      Image:Image.network("http://safemedicinesindia.in/PSMNewz/17Nov13/images/priscription.jpg"),
    ),
    Report(
      Date: "04/11/2017",
      Doctor: "Dr.Medha Oak ",
      Image:Image.network("http://2.bp.blogspot.com/-XwWdZVmumkE/T5pDRn6fJJI/AAAAAAAABRc/nJBEj5WenKc/s1600/Ultrasonogram%2B31March12_1.jpg"),

    ),
    Report(
      Date: "09/10/2018",
      Doctor: "Dr. Manash Saha",
      Image:Image.network("http://1.bp.blogspot.com/-0Y7y9PjjY38/T5pDStGyJtI/AAAAAAAABSA/_31vZkVWIkI/s1600/Urine%2BRoutine%2BExamination.jpg",),
    ),
    Report(
      Date: "04/08/2017",
      Doctor: "Dr. Manash Saha",
      Image:Image.network(          "http://2.bp.blogspot.com/-d2hQF0ZvmBA/T7Y9c_cC5dI/AAAAAAAABYc/SK80BC9GSjc/s1600/14_15May_prescription.jpg",),
    ),
  ];

  PatientEntry curpatient = null;

  DateFormat formatter = DateFormat("dd/MM/yyyy");

  DateTime date = DateTime.now();
  void _selectDate(BuildContext context)async{

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
    print(picked);
  }
  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < patients.length; i++) {
      if (patients[i].ID == widget.ID) {
        curpatient = patients[i];
        break;
      }
    }
    if (curpatient != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Patient"),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.camera_alt), onPressed:(){
                print("Geting Image");
                getImage();
                setState(() {
                  reports.insert(0,Report(
                    Doctor: "Dr. Ruchi",
                    Date: formatter.format(DateTime.now()),
                    Image: Image.file(_image),
                  ));print(reports);
                });
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Next Appointment",style: TextStyle(color: Colors.indigo,fontSize: 15.0),),
                      onPressed: (){
                      print("getting date");
                      _selectDate(context);
                      },
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage("Images/original.png"),
                fit: BoxFit.cover,
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Text(
                      "Patient ID: ${curpatient.ID}",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Text(
                      "Name: ${curpatient.Name}",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Text(
                      "Age: ${curpatient.Age}",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                    child: Text(
                      "Last Visit: ${curpatient.LastVisit}",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: reports.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
                                  child: reports[index].Image,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 5.0,
                                          bottom: 20.0),
                                      child: Text(
                                        reports[index].Doctor,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top:5.0,
                                          bottom: 20.0),
                                      child: Text(
                                        reports[index].Date,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ],
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Patient"),
        ),
        body: Center(
          child: Text("Sory But No Such Patient Exists"),
        ),
      );
    }
  }
}

class PatientEntry {
  String ID;
  String Name;
  double Age;
  String LastVisit;

  PatientEntry({this.ID, this.Age, this.LastVisit, this.Name});
}

class Report {
  Widget Image;
  String Doctor;
  String Date;

  Report({this.Date, this.Doctor, this.Image});
}
