import 'dart:async';

import 'package:aslcom/pages/Home.dart';
import 'package:aslcom/pages/Onboarding.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {

  static const String FIRSTTIME = 'FIRSTTIME';

  void loadPreferences()async{
    var sharedPref = await SharedPreferences.getInstance();
    bool firstTime = await sharedPref.getBool(FIRSTTIME)??false;

    if(!firstTime){
      Get.offAll(const Onboarding());
    }
    Timer(
      const Duration(seconds: 3),
          () async {
            if (!firstTime) {
              Get.offAll(const Onboarding());
            }
            else{
              Get.offAll(const Home());
            }
          }
    );
  }

  @override
  void initState(){
    super.initState();
    loadPreferences();

  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MySizes(context).avidia,
              height: MySizes(context).avidia,
              child: Image.asset('assets/company/company.png'),
            ),
            SizedBox(
              width: 90,
              height: 90,
              child: Lottie.asset('assets/company/splash.json'),
            ),
          ],
        ),
      ),
    );
  }
}
