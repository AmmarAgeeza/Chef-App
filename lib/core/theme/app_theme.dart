import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      //scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColors.white,
      //appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
      ),
      //text theme
      textTheme: TextTheme(
        displayLarge: boldStyle(),
        displayMedium: regularStyle(),
      ),
      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      //text field
      inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //fouced border
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //error border
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //hint
        hintStyle: boldStyle(color: AppColors.grey, fontSize: 16),
        //fill color
        // fillColor: AppColors.lightBlack,
        // filled: true,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            AppColors.grey,
          ),
          textStyle: MaterialStateProperty.all(
              boldStyle(color: AppColors.grey, fontSize: 16)),
        ),
      ));
}
