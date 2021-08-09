import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test_example/presentation/widgets/textfields/textfield_styles.dart';

///
/// This class contains all app themes.
/// All app/text specific colors should be defined here.
/// Text widgets should get the themes from this class.
/// 
class AppThemes {
  static const double OPACITY_LOW = 0.35;
  static const double OPACITY_MIDDLE = 0.5;
  static const double OPACITY_HIGH = 0.9;

  static const Color white = Color(0xffffffff);
  static const Color darkBlue = Color.fromRGBO(12, 29, 48, 1);
  static const Color darkPurple = Color.fromRGBO(30, 34, 52, 1);
  static const Color red = Color.fromRGBO(220, 102, 92, 1);
  static const Color black = Color(0xff030104);
  static const Color grey = Colors.white24;
  static const Color transparent = Colors.transparent;

  // App default theme
  static get defaultTheme {
    final TextFieldStyles _styles = TextFieldStyles();
    return ThemeData(
      primaryColorBrightness: Brightness.light,
      scaffoldBackgroundColor: darkBlue,
      disabledColor: grey,
      primaryColor: darkBlue,
      secondaryHeaderColor: red,
      accentColor: darkPurple,
      backgroundColor: white,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(brightness: Brightness.dark),
      primaryTextTheme: TextTheme(
        button: GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD),
        headline6: GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD, fontSize: 22),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD, color: red),
        helperStyle: GoogleFonts.ubuntu(
            fontWeight: FONTWEIGHT_SEMI_BOLD, color: red, fontSize: 18),
        errorStyle:
            GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD, color: white),
        labelStyle:
            GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD, color: white),
        counterStyle:
            GoogleFonts.ubuntu(fontWeight: FONTWEIGHT_SEMI_BOLD, color: white),
        enabledBorder: OutlineInputBorder(
          borderRadius: _styles.textFieldBorderRadius,
          borderSide: BorderSide(width: _styles.borderWidth, color: red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _styles.textFieldBorderRadius,
          borderSide: BorderSide(width: _styles.borderWidth, color: red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _styles.textFieldBorderRadius,
          borderSide: BorderSide(width: _styles.borderWidth, color: red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: _styles.textFieldBorderRadius,
          borderSide: BorderSide(
              width: _styles.borderWidth, color: red.withOpacity(OPACITY_LOW)),
        ),
      ),
    );
  }

  static const FontWeight FONTWEIGHT_THIN = FontWeight.w100;
  static const FontWeight FONTWEIGHT_EXTRA_LIGHT = FontWeight.w200;
  static const FontWeight FONTWEIGHT_LIGHT = FontWeight.w300;
  static const FontWeight FONTWEIGHT_REGULAR = FontWeight.w400;
  static const FontWeight FONTWEIGHT_MEDIUM = FontWeight.w500;
  static const FontWeight FONTWEIGHT_SEMI_BOLD = FontWeight.w600;
  static const FontWeight FONTWEIGHT_BOLD = FontWeight.w700;
  static const FontWeight FONTWEIGHT_EXTRA_BOLD = FontWeight.w800;
  static const FontWeight FONTWEIGHT_BLACK = FontWeight.w900;
}
