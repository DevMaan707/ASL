import 'package:flutter/material.dart';
import 'package:aslcom/utils/constants/MyColors.dart';
import 'package:aslcom/utils/customs/MyElevatedButton.dart';
import 'package:aslcom/utils/customs/MyTextField.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      //primaryColor:
      scaffoldBackgroundColor:MyColors.primaryBackground,
      elevatedButtonTheme: MyElevatedButtonTheme.lightEBTheme(context),
      inputDecorationTheme: MyInputDecorationTheme.lightInputDecoration(context),

    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      scaffoldBackgroundColor:MyColors.primaryDarkBackground,
      inputDecorationTheme: MyInputDecorationTheme.darkInputDecoration(context),
      elevatedButtonTheme: MyElevatedButtonTheme.lightEBTheme(context),
    );
  }
}
