import 'package:flutter/material.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';

class TextStyled {
  static TextStyle font24Blue600 = const TextStyle(
    color: Colors.blue,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font24DarkBlue400 = TextStyle(
    color: HexColor("#282561"),
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16DarkBlue400 = TextStyle(
    color: HexColor("#282561"),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16DarkBlue700 = TextStyle(
    color: HexColor("#282561"),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font16Black400 = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16Grey400 = TextStyle(
    color: HexColor("#444444"),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
