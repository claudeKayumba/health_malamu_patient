import 'package:flutter/services.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

class AppTheme {
  static const textStyle = TextStyle(
    fontFamily: "GoogleSans",
  );
  static final _textTheme = TextTheme(
    bodyText1: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    bodyText2: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    subtitle1: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    subtitle2: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    button: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    caption: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline1: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline2: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline3: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline4: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline5: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    headline6: textStyle.copyWith(color: AppColors.BLACK_COLOR),
    overline: textStyle.copyWith(color: AppColors.BLACK_COLOR),
  );
  static final _darkTextTheme = TextTheme(
    bodyText1: textStyle.copyWith(color: Colors.grey.shade200),
    bodyText2: textStyle.copyWith(color: Colors.grey.shade200),
    subtitle1: textStyle.copyWith(color: Colors.grey.shade200),
    subtitle2: textStyle.copyWith(color: Colors.grey.shade200),
    button: textStyle.copyWith(color: Colors.grey.shade200),
    caption: textStyle.copyWith(color: Colors.grey.shade200),
    headline1: textStyle.copyWith(color: Colors.grey.shade200),
    headline2: textStyle.copyWith(color: Colors.grey.shade200),
    headline3: textStyle.copyWith(color: Colors.grey.shade200),
    headline4: textStyle.copyWith(color: Colors.grey.shade200),
    headline5: textStyle.copyWith(color: Colors.grey.shade200),
    headline6: textStyle.copyWith(color: Colors.grey.shade200),
    overline: textStyle.copyWith(color: Colors.grey.shade200),
  );
  static const tiletyle =
      TextStyle(fontSize: 16.0, color: AppColors.BLACK_COLOR);
  static const bodyStyle =
      TextStyle(fontSize: 15.0, color: AppColors.BLACK_COLOR);
  static const smallestTextStyle =
      TextStyle(fontSize: 11.0, color: AppColors.BLACK_COLOR);
  static const smallTextStyle =
      TextStyle(fontSize: 12.0, color: AppColors.BLACK_COLOR);
  static const mediumTextStyle =
      TextStyle(fontSize: 14.0, color: AppColors.BLACK_COLOR);
  static const bigTextStyle =
      TextStyle(fontSize: 16.0, color: AppColors.BLACK_COLOR);
  static const bigestTextStyle =
      TextStyle(fontSize: 24.0, color: AppColors.BLACK_COLOR);

  static ThemeData get lightMode {
    setOverLayStyle(false);
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xFFFFFFFF),
      colorScheme: const ColorScheme.light(),
      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColors.SCAFFOLD_BACKGROUND,
      dividerColor: AppColors.DARK_SCAFFOLD_BACKGROUND,
      canvasColor: AppColors.SCAFFOLD_BACKGROUND,
      iconTheme: const IconThemeData(color: AppColors.DARK_COLOR),
      cardColor: AppColors.WHITE_COLOR,
      // shadowColor: Colors.grey.shade200,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.WHITE_COLOR,
          toolbarTextStyle: textStyle,
          iconTheme: IconThemeData(color: AppColors.DARK_COLOR),
          titleTextStyle: TextStyle(color: AppColors.DARK_COLOR)),
    );
  }

  static ThemeData get darkMode {
    setOverLayStyle(true);
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.BLACK_COLOR,
      colorScheme: const ColorScheme.dark(),
      textTheme: _darkTextTheme,
      scaffoldBackgroundColor: AppColors.DARK_SCAFFOLD_BACKGROUND,
      dividerColor: AppColors.WHITE_COLOR,
      canvasColor: AppColors.DARK_COLOR,
      // shadowColor: AppColors.DARK_COLOR.withOpacity(0.3),
      cardColor: AppColors.DARK_COLOR,
      iconTheme: const IconThemeData(color: AppColors.WHITE_COLOR),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.DARK_COLOR,
        toolbarTextStyle: textStyle,
        iconTheme: IconThemeData(color: AppColors.WHITE_COLOR),
      ),
    );
  }

  static setOverLayStyle([bool? isDark]) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDark! ? AppColors.DARK_COLOR : AppColors.WHITE_COLOR,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            isDark ? AppColors.DARK_COLOR : Colors.grey.shade100,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static setCustomOverLayStyle([bool isBlue = false]) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isBlue ? AppColors.ACCENT_COLOR : AppColors.WHITE_COLOR,
        statusBarBrightness: isBlue ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isBlue ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.grey.shade100,
        systemNavigationBarIconBrightness:
            isBlue ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
