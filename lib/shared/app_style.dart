import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// AppStyle returns a TexStyle object..
TextStyle appStyle({ required double? fontSize, required Color color, required FontWeight fontWeight}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}
