import 'package:aslcom/pages/Home.dart';
import 'package:aslcom/pages/Splash.dart';
import 'package:aslcom/utils/constants/AllTexts.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';
import  'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  bool onlastPage = false;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlastPage = (index == 2);
              });
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MySizes(context).illustrationHeight,
                    child: Image.asset('assets/Illustrations/1.png'),
                  ),
                  AllTexts.onboardingTitle1_1Text(context),
                  AllTexts.onboardingTitle1_2Text(context),
                  AllTexts.onboardingPara1Text(context),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MySizes(context).illustrationHeight,
                    child: Center(
                      child: Image.asset(
                          'assets/Illustrations/2.png'),
                    ),
                  ),
                  AllTexts.onboardingTitle2Text(context),
                  AllTexts.onboardingPara2Text(context),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MySizes(context).illustrationHeight,
                    child: Center(
                      child: Image.asset('assets/Illustrations/3.png'),
                    ),
                  ),
                  AllTexts.onboardingTitle3Text(context),
                  AllTexts.onboardingPara3Text(context),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: (onlastPage)
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var sharedPrefs =
                      await SharedPreferences.getInstance();
                      sharedPrefs.setBool(
                          SplashState.FIRSTTIME, true);
                      Get.to(const Home(),
                          transition: Transition.noTransition);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: MySizes(context).broadButton,
                    ),
                    child: const Text("Get Started"),
                  ),
                  SizedBox(
                    height: MySizes(context).standardSizedBox,
                  ),

                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: const Text("Skip"),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 5, dotWidth: 5),
                    count: 3,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    child: const Text("Next"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
