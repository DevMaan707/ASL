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
    if (firstTime){
      Get.offAll(const Home());
    }
    else{
      Get.offAll(const Onboarding());
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.15),
              child: Column(
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
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: MySizes(context).standardPadding),
          //     child: SizedBox(
          //       width: 100,
          //       height: 100,
          //       child: Image.asset('assets/company/Noobsverse.png'),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
