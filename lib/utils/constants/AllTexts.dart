import 'package:flutter/material.dart';
import 'package:aslcom/utils/customs/MyTexts.dart';

class AllTexts {
  static const String onboardingTitle1_1 = "Welcome to";
  static const String onboardingTitle1_2 = "ASL Translator";
  static const String onboardingTitle2 = "Ease translation at your fingertips";
  static const String onboardingTitle3 = "Connect and communicate effortlessly";
  static const String onboardingPara1 = "Discover a seamless way to translate ASL to English and vice versa!";
  static const String onboardingPara2 = "Simply type or record, let our advanced tech do the rest!";
  static const String onboardingPara3 = "Break dowm the language barrier and enhance your communication skills!";

  static Text onboardingTitle1_1Text(BuildContext context) {
    return Text(
      onboardingTitle1_1,
      style: MyTexts.textmdbold(context),
    );
  }

  static Text onboardingTitle1_2Text(BuildContext context) {
    return Text(
      onboardingTitle1_2,
      textAlign: TextAlign.center,
      style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingTitle2Text(BuildContext context) {
    return Text(
      onboardingTitle2,
      textAlign: TextAlign.center,
      style: MyTexts.textmdbold(context),
    );
  }

  static Text onboardingTitle3Text(BuildContext context) {
    return Text(
      onboardingTitle3,
      textAlign: TextAlign.center,
      style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingPara1Text(BuildContext context) {
    return Text(
      onboardingPara1,
     textAlign: TextAlign.center,
     // style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingPara2Text(BuildContext context) {
    return Text(
      onboardingPara2,
      textAlign: TextAlign.center,
      //style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingPara3Text(BuildContext context) {
    return Text(
      onboardingPara3,
     textAlign: TextAlign.center,
     // style: MyTexts.textmdbold(context),
    );
  }
}
