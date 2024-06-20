
import 'package:flutter/material.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';

class Paddings {
  static EdgeInsets standardPadding(BuildContext context) {
    return EdgeInsets.only(
        top: MySizes(context).standardPadding,
        bottom: MySizes(context).standardPadding);
  }

  static EdgeInsets allStandardPadding(BuildContext context) {
    return EdgeInsets.all(MySizes(context).standardPadding);
  }

  static EdgeInsets allStandardPaddingChild(BuildContext context) {
    return EdgeInsets.only(
        left: MySizes(context).standardPadding,
        right: MySizes(context).standardPadding,
        top: MySizes(context).smallPadding,
        bottom: MySizes(context).smallPadding);
  }

  static EdgeInsets allStandardPaddingSmall(BuildContext context) {
    return EdgeInsets.all(MySizes(context).smallPadding);
  }

  static EdgeInsets allStandardPaddingxSmall(BuildContext context) {
    return EdgeInsets.all(MySizes(context).xsmallPadding);
  }

  static EdgeInsets standardPaddingHeading(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
      top: MySizes(context).standardPadding,
      right: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets standardPaddingChild(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
      top: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets noSafeAreaDefault(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
      top: MySizes(context).safeAreatopPadding,
      right:  MySizes(context).standardPadding,
    );
  }

  static EdgeInsets noSafeAreaSmall(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
      top: MySizes(context).safeAreatopPaddingSmall,
    );
  }


  static EdgeInsets onlyTop(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets onlyTopStandard(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets onlyTopLarge(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).largePadding,
    );
  }

  static EdgeInsets topnleftrightLarge(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).largePadding,
      left: MySizes(context).standardPadding,
      right: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets topnleft(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).largePadding,
      left: MySizes(context).standardPadding,

    );
  }

  static EdgeInsets onlyTopSmall(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).xsmallPadding,
    );
  }

  static EdgeInsets onlyRight(BuildContext context) {
    return EdgeInsets.only(
      right: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets onlyRightLarge(BuildContext context) {
    return EdgeInsets.only(
      right: MySizes(context).largePadding,
    );
  }

  static EdgeInsets onlyRightStandard(BuildContext context) {
    return EdgeInsets.only(
      right: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets onlyLeft(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets onlyLeftSmall(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets onlyLeftLarge(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).largePadding,
    );
  }

  static EdgeInsets leftRight(BuildContext context) {
    return EdgeInsets.only(
      left: MySizes(context).standardPadding,
      right: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets onlyBottom(BuildContext context) {
    return EdgeInsets.only(
      bottom: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets topBottom(BuildContext context) {
    return EdgeInsets.only(
      bottom: MySizes(context).smallPadding,
      top: MySizes(context).smallPadding,
    );
  }

  static EdgeInsets handout(BuildContext context) {
    return EdgeInsets.only(
        bottom: MySizes(context).smallPadding,
        top: MySizes(context).smallPadding,
        left: MySizes(context).standardPadding,
        right: MySizes(context).standardPadding);
  }


  static EdgeInsets standardLeftTop(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).standardPadding,
      left: MySizes(context).standardPadding,
    );
  }
  static EdgeInsets standardRightTop(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).standardPadding,
      left: MySizes(context).standardPadding,
    );
  }

  static EdgeInsets onlyBottomLarge(BuildContext context) {
    return EdgeInsets.only(
      bottom: MySizes(context).largePadding,
    );
  }

  static EdgeInsets updateIcon(BuildContext context) {
    return EdgeInsets.only(
      top: MySizes(context).largePadding*2.8,
      right:  MySizes(context).largePadding,
    );
  }

}
