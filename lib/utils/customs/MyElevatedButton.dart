import 'package:aslcom/utils/customs/CustomBorder.dart';
import 'package:flutter/material.dart';

import 'package:aslcom/utils/constants/MyColors.dart';
import 'package:aslcom/utils/customs/MySIzes.dart';

class MyElevatedButtonTheme {
  static lightEBTheme(BuildContext context) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: MyColors.accent2,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          textStyle: TextStyle(
            fontSize: MySizes(context).textstandard,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderR.standardBorderRadius(context),
          ),
        ),
    );
  }

  static darkEBTheme(BuildContext context) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: MyColors.accent2,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,

          padding: const EdgeInsets.all(0),
          textStyle: TextStyle(
            fontSize: MySizes(context).textmdbold,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderR.standardBorderRadius(context),
          ),
        ),
    );
  }
}
