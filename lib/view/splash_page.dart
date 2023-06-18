import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/controller/splash_controller.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerBackgroundColor,
      body: Center(
        child: Text(
          "Welcome to my shopping App",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
