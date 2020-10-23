import 'package:flutter/material.dart';
import 'package:sfphad/common/colors.dart';
import 'package:sfphad/locator.dart';
import 'package:sfphad/router.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Sofia',
        textTheme: TextTheme(
          headline2: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: headline2,
          ),
        ),
      ),
      onGenerateRoute: AppRouter.getRoutes,
      initialRoute: '/patient',
    );
  }
}
