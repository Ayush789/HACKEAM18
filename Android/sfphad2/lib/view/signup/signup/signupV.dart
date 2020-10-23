import 'package:flutter/material.dart';
import 'package:sfphad/common/RoundedTextField.dart';
import 'package:sfphad/common/padding.dart';
import 'package:sfphad/view/signup/signup/signupVM.dart';
import 'package:stacked/stacked.dart';

class SignUpV extends StatefulWidget {
  @override
  _SignUpVState createState() => _SignUpVState();
}

class _SignUpVState extends State<SignUpV> {
  TextEditingController nameController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ViewModelBuilder<SignUpVM>.reactive(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RoundedTextField(
                        controller: nameController,
                        labelText: "Name",
                      ),
                      VPadding(20),
                      RoundedTextField(
                        controller: hospitalController,
                        labelText: "Hospital",
                      ),
                      VPadding(20),
                      RoundedTextField(
                        controller: specialityController,
                        labelText: "Speciality",
                      ),
                    ],
                  ),
                  if (model.isBusy)
                    Opacity(
                      opacity: 0.5,
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              ),
            );
          },
          viewModelBuilder: () => SignUpVM()),
    );
  }
}
