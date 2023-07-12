import 'package:flutter/material.dart';

import 'font_manager.dart';

// this is main function for create text style or style
// ignore: unused_element
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamaily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

//light style
TextStyle getLightTextStyle(
    {double fontSize = FontSize.s12f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSize.s14f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSize.s18f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSize.s20f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSize.s22f, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}
