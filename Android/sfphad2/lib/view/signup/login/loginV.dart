import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfphad/common/RoundedTextField.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/common/padding.dart';
import 'package:sfphad/view/signup/login/loginVM.dart';
import 'package:stacked/stacked.dart';

class LoginV extends StatefulWidget {
  @override
  _LoginVState createState() => _LoginVState();
}

class _LoginVState extends State<LoginV> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVM>.reactive(
      builder: (context, model, child) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    VPadding(20),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    VPadding(20),
                    RoundedTextField(
                      labelText: "Email",
                      controller: usernameController,
                      color: Colors.white,
                    ),
                    VPadding(20),
                    RoundedTextField(
                      labelText: "Password",
                      controller: passwordController,
                      color: Colors.white,
                      obscureText: true,
                    ),
                    VPadding(10),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        HPadding(10),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    VPadding(20),
                    MaterialButton(
                      minWidth: width / 2,
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => LoginVM(),
    );
  }
}
