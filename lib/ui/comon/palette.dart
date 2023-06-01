import 'dart:math';

import 'package:flutter/material.dart';


/// this class is use for manage all app color

class Palette {
  //primary material color for the all app
  static MaterialColor kPrimarySwatch = Palette().generateMaterialColor(
      Color(int.parse('FF8E01', radix: 16)).withOpacity(1.0)); //255, 142, 1, 1
  static Color appThemeColor =
      Color(int.parse('FF8E01', radix: 16)).withOpacity(1.0); //#FF8E01
  static Color appWhiteColor = Colors.white;
  static Color appSucces = const Color.fromARGB(255, 133, 248, 137);
  static Color appError = const Color.fromARGB(255, 245, 87, 59);

  static Color gryedColor = const Color.fromARGB(255, 143, 149, 143);

  /// this method return an @MaterialColor. it take an Color Object in argument 

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
