import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// AppStyle returns a TexStyle object..
TextStyle appStyle(
    {required double fontSize,
    required Color color,
    required FontWeight fontWeight}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    
  );
}

// Custom Padding...
EdgeInsetsGeometry customLTRB({
  required double left,
  required double top,
  required double right,
  required double bottom,
}) {
  return EdgeInsets.fromLTRB(
    left.w,
    top.h,
    right.w,
    bottom.h,
  );
}

//custom AppStyle With height...
TextStyle appStyleWithHeight(
    {required double fontSize,
    required Color color,
    required FontWeight fontWeight,
    required double height}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: height,
  );
}