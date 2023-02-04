import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view/home_secreen.dart';

import '../../view/login_secreen.dart';
import '../../view/signup_secreen.dart';
import '../../view/splash_secreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashSecreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeSecreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginSecreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpSecreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}
