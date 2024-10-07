import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      visualDensity: VisualDensity.comfortable,
      accentColor: Pallete.primary,
      backgroundColor: Pallete.background,
      disabledColor: Pallete.grey,
      cursorColor: Pallete.primary,
      errorColor: Pallete.red,
      primaryColor: Pallete.primary,
      textTheme: GoogleFonts.nunitoSansTextTheme(
        Theme.of(context).textTheme,
      ),
      iconTheme: IconThemeData(
        color: Pallete.primaryDark,
        size: 20.0,
      ),
      scaffoldBackgroundColor: Pallete.background,
      splashColor: Pallete.grey,
    );
  }
}
