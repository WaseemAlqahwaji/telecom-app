import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/theming/text_style.dart';

class KTheme {
  static Color mainColor = HexColor("#282561");
  static Color secondColor = HexColor("#1D7291");
  static ThemeData ligthTheme() => ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
        ),
        fontFamily: "Cairo",
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle: TextStyled.font16Grey400.copyWith(
            color: Colors.grey.withOpacity(.6)
          ),
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.withOpacity(.7),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.withOpacity(.7),
            ),
          ),
        ),
      );
}
