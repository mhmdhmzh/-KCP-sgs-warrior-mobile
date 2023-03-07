import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core/common/extensions.dart';

class CustomTheme with ChangeNotifier {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.mulish().fontFamily,
        // textTheme: TextTheme(
        //    headline1: ThemeData.light().textTheme.headline1?.copyWith(color: CustomColors.textPrimaryColor, fontWeight: FontWeight.w400, fontSize: 14.0),
        //    headline2: ThemeData.light().textTheme.headline1?.copyWith(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20.0, fontFamily: GoogleFonts.aclonica().fontFamily),
        // )
      );

  static ThemeData get darkTheme =>
      lightTheme.copyWith(scaffoldBackgroundColor: Colors.yellow);

  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

class CustomColors {
  static Color get primaryColor => '#a6ced6'.toColor();
  static Color get textPrimaryColor => '#000000'.toColor();
  static Color get textSecondaryColor => '#444444'.toColor();
}
