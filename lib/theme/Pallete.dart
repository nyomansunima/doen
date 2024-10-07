import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Cover all of the Style and Palleting, Text and properties theme
///
class Pallete {
  /*
   * Initialize the color of apps system
   */

  static const primary = Color(0xFF2554FA);
  static const lightBlue = Color(0xFF69E4FF);
  static const red = Color(0xFFFF6770);
  static const orange = Color(0xFFFFB966);
  static const purple = Color(0xFF744AEC);
  static const grey = Color(0xFFF3F4F5);
  static const primaryDark = Color(0xFF363739);
  static const secondaryDark = Color(0xFF606060);
  static const white = Color(0xFFFFFFFF);
  static const background = Color(0xFFEFF4F3);
  static const transparent = Color(0x00000000);

  /*
   * Initialize for textStyle
   */

  static TextStyle hugeTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
    height: 1.6,
    letterSpacing: -0.3,
  );

  static TextStyle title = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
    height: 1.6,
    letterSpacing: -0.3,
  );
  static TextStyle button = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    height: 1.41,
    letterSpacing: -.3,
    fontSize: 12.0,
  );
  static TextStyle inputLabel = GoogleFonts.nunitoSans(
    fontSize: 13.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -.3,
  );
  static TextStyle body = GoogleFonts.nunitoSans(
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
    letterSpacing: -.3,
    height: 1.1,
  );
  static TextStyle cardTitle = GoogleFonts.montserrat(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -.3,
    height: 1.2,
  );
  /** Glas effect  */
}
