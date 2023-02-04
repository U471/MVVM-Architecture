import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_architecture/res/constent/app_image_path.dart';
import 'package:mvvm_architecture/view_model/services/splash_services.dart';

class SplashSecreen extends StatefulWidget {
  const SplashSecreen({super.key});

  @override
  State<SplashSecreen> createState() => _SplashSecreenState();
}

class _SplashSecreenState extends State<SplashSecreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(splash),
    ));
  }
}
