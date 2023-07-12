import 'package:advanced_arabic_mina_course/presentation%20layers/resources/styles_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager
        .lightPrimary, // riplee effect اللي بيحصل لما بتدوس علي الزرار كتير

    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularTextStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16f,
      ),
    ),

    // button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.gray1,
      splashColor: ColorManager.primaryColor,
      buttonColor: ColorManager.lightPrimary,
    ),

    // Eleveted button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.white,
        disabledForegroundColor: ColorManager.gray1,
        textStyle: getRegularTextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17f,
        ),
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16f,
      ),
      headlineLarge: getSemiBoldTextStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s14f),
      headlineMedium: getRegularTextStyle(
          color: ColorManager.primaryColor, fontSize: FontSize.s16f),
      titleMedium: getMediumTextStyle(
          color: ColorManager.lightGrey, fontSize: FontSize.s14f),
      bodyLarge: getRegularTextStyle(
          color: ColorManager.primaryColor, fontSize: FontSize.s16f),
      bodySmall: getRegularTextStyle(color: ColorManager.grey),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularTextStyle(
          color: ColorManager.grey, fontSize: FontSize.s14f),
      labelStyle:
          getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14f),

      errorStyle: getRegularTextStyle(
          color: ColorManager.error, fontSize: FontSize.s14f),
      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.gray1,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
