import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inputDecoration({
  String? label,
  String? hint,
  IconData? icon,
  Widget? suffix,
  double radius = 10,
  bool hasBorder = true,
  Color? color = Colors.white,
  double fontSize = 16.0,
}) {
  print(hasBorder);
  return InputDecoration(
    prefixIcon: icon != null
        ? Icon(
            icon,
          )
        : null,
    suffix: suffix,
    hintText: hint ?? label,
    filled: true,
    fillColor: color,
    labelText: label,
    hintStyle: TextStyle(
        fontSize: fontSize, fontFamily: GoogleFonts.tajawal().fontFamily),
    labelStyle: TextStyle(
        fontSize: fontSize, fontFamily: GoogleFonts.tajawal().fontFamily),
    errorStyle: const TextStyle(
      color: Colors.red,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            style: hasBorder ? BorderStyle.solid : BorderStyle.none, width: 1)),
  );
}
