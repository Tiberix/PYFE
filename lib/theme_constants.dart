import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//const COLOR_BLACK = Colors.black;
//const COLOR_ORANGE = Colors.deepOrange;
//const COLOR_GREY = Color(0xff9E9E9E);
//const COLOR_WHITE = Color(0xffFFA801);
//const COLOR_GREEN = Color(0xff7BB655);

const Color textColor = Colors.black;

TextTheme defaultText = TextTheme(
    headline1: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 96, color: textColor),
    headline2: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 60, color: textColor),
    headline3: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 48, color: textColor),
    headline4: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 34, color: textColor),
    headline5: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 24, color: textColor),
    headline6: GoogleFonts.nunito(
        fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
    bodyText1: GoogleFonts.nunito(
        fontSize: 16, fontWeight: FontWeight.normal, color: textColor),
    bodyText2: GoogleFonts.nunito(
        fontSize: 14, fontWeight: FontWeight.normal, color: textColor),
    subtitle1: GoogleFonts.nunito(
        fontSize: 16, fontWeight: FontWeight.normal, color: textColor),
    subtitle2: GoogleFonts.nunito(
        fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
    button: GoogleFonts.nunito(
        fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
    caption: GoogleFonts.nunito(
        fontSize: 12, fontWeight: FontWeight.normal, color: textColor));
