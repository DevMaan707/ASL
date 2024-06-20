import 'package:flutter/material.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';

class MyTexts {
  static TextStyle textmdbold(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MySizes(context).textmdbold,
    );
  }

  static TextStyle mainHeading(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MySizes(context).mainHeading,

    );
  }

  static TextStyle subHeading(BuildContext context) {
    return TextStyle(
      fontSize: MySizes(context).subHeading,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiHeading(BuildContext context) {
    return TextStyle(
      fontSize: MySizes(context).semiHeading,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle smallHeading(BuildContext context) {
    return TextStyle(
      fontSize: MySizes(context).smallHeading,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle xsmallHeading(BuildContext context) {
    return TextStyle(
      fontSize: MySizes(context).smallHeading,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle smallHeadingThin(BuildContext context) {
    return TextStyle(
      fontSize: MySizes(context).smallHeading,
    );
  }
}
