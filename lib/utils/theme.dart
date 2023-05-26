import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs
  static const Color primaryColor = Color(0xFF6ED1CE);
  static const Color secondaryColor = Color(0xFFF7933A);
  static const Color grayColor = Color(0xFF847A7A);
  static const Color darkPrimaryColor = Color(0xFF09757A);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color nearWhiteColor = Color(0xFFF5F5F5);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color blueColor = Color(0xFF007AFF);
  static const Color lightGrayColor = Color(0xFFD3D3D3);
  static const Color validColor = Color(0xFF22C55E);

  // Fonts
  static const String fontThin = 'Inter-Thin';
  static const String fontLight = 'Inter-Light';
  static const String fontRegular = 'Inter-Regular';
  static const String fontMedium = 'Inter-Medium';
  static const String fontSemiBold = 'Inter-SemiBold';
  static const String fontBold = 'fonts/Inter-Bold';
  static const String fontExtraBold = 'Inter-ExtraBold';
  static const String fontBlack = 'Inter-Black';

  // Size
  static const double headline1Size = 32.0;
  static const double headline2Size = 28.0;
  static const double headline3Size = 24.0;
  static const double headline4Size = 20.0;
  static const double headline5Size = 18.0;
  static const double headline6Size = 16.0;
  static const double subtitle1Size = 14.0;
  static const double subtitle2Size = 12.0;
  static const double bodyText1Size = 16.0;
  static const double bodyText2Size = 14.0;
  static const double buttonSize = 16.0;
  static const double captionSize = 12.0;
  static const double overlineSize = 10.0;

  // Spacing
  static const double largeSpacing = 32.0;
  static const EdgeInsets largeMarginAll = EdgeInsets.all(largeSpacing);
  static const EdgeInsets largeMarginSymmetric =
      EdgeInsets.symmetric(horizontal: largeSpacing, vertical: largeSpacing);

  static const double mediumSpacing = 24.0;
  static const EdgeInsets mediumMarginAll = EdgeInsets.all(mediumSpacing);
  static const EdgeInsets mediumMarginSymmetric =
      EdgeInsets.symmetric(horizontal: mediumSpacing, vertical: mediumSpacing);

  static const double defaultSpacing = 16.0;
  static const EdgeInsets defaultMarginAll = EdgeInsets.all(defaultSpacing);
  static const EdgeInsets defaultMarginSymmetric = EdgeInsets.symmetric(
      horizontal: defaultSpacing, vertical: defaultSpacing);

  static const double smallSpacing = 8.0;
  static const EdgeInsets smallMarginAll = EdgeInsets.all(smallSpacing);
  static const EdgeInsets smallMarginSymmetric =
      EdgeInsets.symmetric(horizontal: smallSpacing, vertical: smallSpacing);

  static ThemeData lightTheme() {
    return ThemeData(
      // Définir la police par défaut pour tout le texte dans l'application
      primaryColor: primaryColor,
      scaffoldBackgroundColor: grayColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkPrimaryColor,
      ),

      // Définir les styles de texte pour les différentes variantes de graisse et tailles
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: fontBlack,
            fontWeight: FontWeight.w900,
            fontSize: headline1Size),
        headline2: TextStyle(
            fontFamily: fontExtraBold,
            fontWeight: FontWeight.w800,
            fontSize: headline2Size),
        headline3: TextStyle(
            fontFamily: fontBold,
            fontWeight: FontWeight.w700,
            fontSize: headline3Size),
        headline4: TextStyle(
            fontFamily: fontSemiBold,
            fontWeight: FontWeight.w600,
            fontSize: headline4Size),
        headline5: TextStyle(
            fontFamily: fontMedium,
            fontWeight: FontWeight.w500,
            fontSize: headline5Size),
        headline6: TextStyle(
            fontFamily: fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: headline6Size),
        subtitle1: TextStyle(
            fontFamily: fontLight,
            fontWeight: FontWeight.w300,
            fontSize: subtitle1Size),
        subtitle2: TextStyle(
            fontFamily: fontThin,
            fontWeight: FontWeight.w200,
            fontSize: subtitle2Size),
        bodyText1: TextStyle(
            fontFamily: fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: bodyText1Size),
        bodyText2: TextStyle(
            fontFamily: fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: bodyText2Size),
        button: TextStyle(
            fontFamily: fontMedium,
            fontWeight: FontWeight.w500,
            fontSize: buttonSize),
        caption: TextStyle(
            fontFamily: fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: captionSize),
        overline: TextStyle(
            fontFamily: fontRegular,
            fontWeight: FontWeight.w400,
            fontSize: overlineSize),
      ),

      // Définir d'autres propriétés de thème
      // ...
    );
  }

  // Définir d'autres thèmes (ex : darkTheme) si nécessaire
  // ...
}
