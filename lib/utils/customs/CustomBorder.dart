import 'package:aslcom/utils/customs/MySIzes.dart';
import 'package:flutter/material.dart';

class BorderR {
  static BorderRadius standardBorderRadius(BuildContext context) {
    return BorderRadius.circular(MySizes(context).smallBorderRadius);
  }

  static BorderRadius largeBorderRadius(BuildContext context) {
    return BorderRadius.circular(MySizes(context).largeBorderRadius);
  }
}

class RadiusR {
  static Radius standardRadius(BuildContext context) {
    return Radius.circular(MySizes(context).smallBorderRadius);
  }

  static Radius largeRadius(BuildContext context) {
    return Radius.circular(MySizes(context).largeBorderRadius);
  }
}
