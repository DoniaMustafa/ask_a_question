import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
  headline5: GoogleFonts.roboto(
      fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      letterSpacing: 0.1),
  bodyText1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      letterSpacing: 0.5),

  bodyText2: GoogleFonts.roboto(
    color:  Color(0xFF303030),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),

  button: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1.25),
  caption: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[900],
      letterSpacing: 0.4),
  overline: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      letterSpacing: 1.5),
);


ThemeData textThemeData = ThemeData(
  textTheme: TextTheme(
    headline5: GoogleFonts.roboto(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 0.1),
    bodyText1: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 0.5),
    bodyText2: GoogleFonts.roboto(
        color:  Color(0xFF303030),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25
    ),

    button: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.25),
    caption: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF303031),
        letterSpacing: 0.4),
    overline: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        letterSpacing: 1.5),
  )
);