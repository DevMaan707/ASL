import 'package:flutter/material.dart';

class MySizes {
  final BuildContext context;
  MySizes(this.context);

  //onboarding screens
  double get illustrationHeight => MediaQuery.of(context).size.height * 0.55;

  //texts sizes
  double get textmdbold => MediaQuery.of(context).size.width * 0.06;
  double get textstandard => MediaQuery.of(context).size.width * 0.04;

  //Paddings
  double get safeAreatopPadding => MediaQuery.of(context).size.width * 0.20;
  double get standardPadding => MediaQuery.of(context).size.width * 0.05;
  double get smallPadding => MediaQuery.of(context).size.width * 0.025;
  double get xsmallPadding => MediaQuery.of(context).size.width * 0.011;
  double get largePadding => MediaQuery.of(context).size.width * 0.08;
  double get safeAreatopPaddingSmall => MediaQuery.of(context).size.width * 0.1;

  //Containers Border Radius
  double get smallBorderRadius => MediaQuery.of(context).size.width * 0.01;
  double get largeBorderRadius => MediaQuery.of(context).size.width * 0.03;

  //Texts
  double get smallHeading => MediaQuery.of(context).size.width * 0.041; //17 ig
  double get subHeading => MediaQuery.of(context).size.width * 0.06;
  double get semiHeading => MediaQuery.of(context).size.width * 0.05;
  double get xsmallHeading => MediaQuery.of(context).size.width * 0.03;
  double get mainHeading => MediaQuery.of(context).size.width * 0.08;

  //Icon
  double get mainIconWidth => MediaQuery.of(context).size.width * 0.43;
  double get mainIconHeight => MediaQuery.of(context).size.width * 0.47;

  //DocumentType Icon
  double get subIconWidth => MediaQuery.of(context).size.width * 0.12;
  double get subIconHeight => MediaQuery.of(context).size.width * 0.12;

  //BottomNavBar
  double get mainNavContainerHeight => MediaQuery.of(context).size.width * 0.29;
  double get mainNavContainerWidth => MediaQuery.of(context).size.width;

  //Folder container
  double get folderWidth => MediaQuery.of(context).size.width * 0.4;
  double get folderHeight => MediaQuery.of(context).size.width * 0.35;

  //Button
  Size get broadButton => Size(MediaQuery.of(context).size.width * 0.7,
      MediaQuery.of(context).size.width * 0.15);

  //SizedBox
  double get standardSizedBox => MediaQuery.of(context).size.width * 0.05;

  //Progress Indicator
  double get buttonprogressindicator =>
      MediaQuery.of(context).size.width * 0.05;
  //splash
  double get avidia => MediaQuery.of(context).size.width * 0.45;
  double get noobverse => MediaQuery.of(context).size.width * 0.3;
}
