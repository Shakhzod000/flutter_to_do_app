

import 'package:flutter/material.dart';

class Apputils{
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

 static void themeChanger(){
  themeMode.value = themeMode.value == ThemeMode.light? ThemeMode.dark : ThemeMode.light;
  }
}