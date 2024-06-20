import 'package:flutter/material.dart';
import 'package:aslcom/utils/customs/MyTexts.dart';

class AllTexts {
  static const String onboardingTitle1_1 = "Welcome to";
  static const String onboardingTitle1_2 = "AU Notes";
  static const String onboardingTitle2 = "Search with Tags";
  static const String onboardingTitle3 = "AI Chatbot";
  static const String onboardingPara1 = "Browse all notes quickly!";
  static const String onboardingPara2 = "Instantly find relevant notes by searching tags";
  static const String onboardingPara3 = "Ask questions directly within your notes and get immediate answers from our AI.";

  static Text onboardingTitle1_1Text(BuildContext context) {
    return Text(
      onboardingTitle1_1,
      style: MyTexts.textmdbold(context),
    );
  }

  static Text onboardingTitle1_2Text(BuildContext context) {
    return Text(
      onboardingTitle1_2,
      style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingTitle2Text(BuildContext context) {
    return Text(
      onboardingTitle2,
      style: MyTexts.textmdbold(context),
    );
  }

  static Text onboardingTitle3Text(BuildContext context) {
    return Text(
      onboardingTitle3,
      style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingPara1Text(BuildContext context) {
    return Text(
      onboardingPara1,
     // style: MyTexts.textmdbold(context),
    );
  }
  static Text onboardingPara2Text(BuildContext context) {
    return Text(
      onboardingPara2,
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
