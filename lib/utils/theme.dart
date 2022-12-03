
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primarClr = blueClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);


class Themes{
    static ThemeData get lightTheme => ThemeData(
      backgroundColor: Colors.white,
         brightness: Brightness.light,
         appBarTheme:const  AppBarTheme(
          backgroundColor: white
         )
      );
        static ThemeData get darkTheme => ThemeData(
          backgroundColor: darkGreyClr,
         brightness: Brightness.dark,
         appBarTheme:const  AppBarTheme(
          backgroundColor: darkGreyClr
         )
      );
}

TextStyle get texStyleTheme{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.grey[400]: Colors.grey,
    )
  );
}
TextStyle get subTexStyleTheme{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.white :Colors.black
    )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Get.isDarkMode? Colors.white:Colors.black
  );
}
TextStyle get subtitleStyle{
  return GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode? Colors.grey[400]:Colors.grey[700]
  );
}