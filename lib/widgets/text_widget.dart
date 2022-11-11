import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DemoBoldTextWidget({
  String? text,
  Color? fontColor,
  double? fontSize,
}) {
  return Text(
    text ?? 'This is Google Fonts',
    style: GoogleFonts.anton(
      color: fontColor ?? Colors.black,
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget DemoRobotoTextWidget({
  String? text,
  Color? fontColor,
  double? fontSize,
}) {
  return Text(
    text ?? 'This is Google Fonts',
    style: GoogleFonts.roboto(
      color: fontColor ?? Colors.black,
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget DemoRobotoMonoTextWidget({
  String? text,
  Color? fontColor,
  double? fontSize,
}) {
  return Text(
    text ?? 'This is Google Fonts',
    style: GoogleFonts.raleway(
      color: fontColor ?? Colors.black,
      fontSize: fontSize ?? 14,
      // fontWeight: FontWeight.w200,
    ),
  );
}

