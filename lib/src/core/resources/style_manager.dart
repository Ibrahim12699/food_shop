import 'package:flutter/material.dart';

TextStyle getBoldStyle({
  Color color = Colors.black,
  double fontSize = 24,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getMediumStyle({
  Color color = Colors.black,
  double fontSize = 24,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w500,
  );
}

TextStyle getRegularStyle({
  Color color = Colors.black,
  double fontSize = 24,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
  );
}
