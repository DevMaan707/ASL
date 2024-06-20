 import 'package:flutter/material.dart';
import 'package:aslcom/utils/constants/MyColors.dart';

class MyInputDecorationTheme{
  static InputDecorationTheme lightInputDecoration(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return InputDecorationTheme(
      hintStyle: const TextStyle(color: MyColors.textLight),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.accent),
      ),
      fillColor: MyColors.textBoxLight,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: MyColors.accent),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: MyColors.accent),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
    );
  }
  static InputDecorationTheme darkInputDecoration(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return InputDecorationTheme(
      //hintStyle: const TextStyle(color: MyColors.textLight),
      border: OutlineInputBorder(
        borderSide: BorderSide(color:MyColors.textBoxDark),
      ),
      fillColor: MyColors.textBoxDark,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: MyColors.textBoxDark),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: MyColors.textBoxDark),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
    );
  }
}