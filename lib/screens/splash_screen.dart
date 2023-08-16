import 'package:flutter/material.dart';
import 'package:homebrew/utils/colors.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseDeviceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOMEBREW",
              style: TextStyle(
                fontSize: 48,
                color: AppColors.whiteColor,
                fontFamily: 'norwester',
                letterSpacing: 2,
              ),
            ),
            Text(
              "Great Coffee at Home",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.whiteColor,
                fontFamily: 'Kollektif',
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
