import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF41C8CE);

enum ColorTheme {
  customColor,
  yellow,
  green,
  blue,
  purple,
  pink,
  red,
  grey,
  black,
}

Color getColorFromTheme(ColorTheme theme) {
  switch (theme) {
    case ColorTheme.customColor:
      return _customColor;
    case ColorTheme.yellow:
      return Colors.yellow;
    case ColorTheme.green:
      return Colors.green;
    case ColorTheme.blue:
      return Colors.blue;
    case ColorTheme.purple:
      return Colors.purple;
    case ColorTheme.pink:
      return Colors.pink;
    case ColorTheme.red:
      return Colors.red;
    case ColorTheme.grey:
      return Colors.grey;
    case ColorTheme.black:
      return Colors.black;
    default:
      return Colors.transparent; // Manejo de caso por defecto
  }
}

class AppTheme {
  final ColorTheme selectedColor;

  AppTheme({this.selectedColor = ColorTheme.customColor});

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: getColorFromTheme(selectedColor),
        brightness: Brightness.dark);
  }
}
