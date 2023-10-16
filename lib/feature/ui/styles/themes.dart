/// 일괄 수정을 위한 테마 정의
/// 작성자 : jtmoon
/// 특이사항 : N/A
/// @copyright 한국선불카드(주)

import 'package:flutter/material.dart';
import 'package:todo_list/feature/ui/styles/colors.dart';
import 'package:todo_list/feature/ui/styles/styles.dart';

class PlgThemes {
  PlgThemes._();
  //----------------------------------------------
  // LIGHT 모드 테마
  //----------------------------------------------
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: Typography.blackMountainView,
    brightness: Brightness.light,
    scaffoldBackgroundColor: PlgColor.white_ffffffff,
    primaryColor: PlgColor.primary_ff1b9dd9,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: PlgColor.primary_ff1b9dd9,
    ),
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      foregroundColor: PlgColor.white_ffffffff,
      backgroundColor: PlgColor.white_ffffffff,
      surfaceTintColor: PlgColor.white_ffffffff,
      elevation: 0,
      titleTextStyle: PlgStyles.h2Black_ff282828_34,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade500,
      indicatorColor: Colors.black,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
    ),
  );

  //----------------------------------------------
  // DARK 모드 테마
  //----------------------------------------------
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: Typography.blackMountainView,
    brightness: Brightness.light,
    scaffoldBackgroundColor: PlgColor.white_ffffffff,
    primaryColor: PlgColor.primary_ff1b9dd9,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: PlgColor.primary_ff1b9dd9,
    ),
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.blue,
      surfaceTintColor: Colors.blue,
      elevation: 0,
      titleTextStyle: PlgStyles.h2Black_ff282828_34,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade500,
      indicatorColor: Colors.black,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
    ),
  );
}
