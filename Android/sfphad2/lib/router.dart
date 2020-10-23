import 'package:flutter/material.dart';
import 'package:sfphad/view/dashboard/Dashboard_V.dart';
import 'package:sfphad/view/onboarding/onboarding_V.dart';
import 'package:sfphad/view/patient/patient_V.dart';

import 'view/signup/landingV.dart';

class AppRouter {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => LandingV(),
        );
      case '/onboarding1':
        return MaterialPageRoute(
          builder: (context) => Onboarding1V(),
        );
      case '/onboarding2':
        return MaterialPageRoute(
          builder: (context) => Onboarding2V(),
        );
      case '/onboarding3':
        return MaterialPageRoute(
          builder: (context) => Onboarding3V(),
        );
      case '/patient':
        return MaterialPageRoute(
          builder: (context) => PatientV(),
        );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (context) => DashboardV(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Text("No Route Names ${settings.name}"),
                ));
    }
  }
}
