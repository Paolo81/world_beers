//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static MaterialColor orange = const MaterialColor(
    0xfff29100, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffda8300), //10%
      100: Color(0xffc27400), //20%
      200: Color(0xffa96600), //30%
      300: Color(0xff915700), //40%
      400: Color(0xff794900), //50%
      500: Color(0xff613a00), //60%
      600: Color(0xff492b00), //70%
      700: Color(0xff301d00), //80%
      800: Color(0xff180e00), //90%
      900: Color(0xff000000), //100%
    },
  );
  static MaterialColor darkGrey = const MaterialColor(
    0xff455058, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff3e484f), //10%
      100: Color(0xff374046), //20%
      200: Color(0xff30383e), //30%
      300: Color(0xff293035), //40%
      400: Color(0xff23282c), //50%
      500: Color(0xff1c2023), //60%
      600: Color(0xff15181a), //70%
      700: Color(0xff0e1012), //80%
      800: Color(0xff070809), //90%
      900: Color(0xff000000), //100%
    },
  );
  static MaterialColor lightGrey = const MaterialColor(
    0xffccd7db, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffb8c2c5), //10%
      100: Color(0xffa3acaf), //20%
      200: Color(0xff8f9799), //30%
      300: Color(0xff7a8183), //40%
      400: Color(0xff666c6e), //50%
      500: Color(0xff525658), //60%
      600: Color(0xff3d4042), //70%
      700: Color(0xff292b2c), //80%
      800: Color(0xff141516), //90%
      900: Color(0xff000000), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.

