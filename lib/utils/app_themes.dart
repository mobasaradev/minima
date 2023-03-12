import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  static final josefinSansTextStyle = GoogleFonts.josefinSans();

  /// TabBar Light theme
  static final _tabBarThemeLight = TabBarTheme(
    labelStyle: josefinSansTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 0, color: AppColors.transparent),
    ),
    unselectedLabelColor: AppColors.secondaryText.withOpacity(.7),
    unselectedLabelStyle: josefinSansTextStyle,
    labelColor: AppColors.primaryText,
  );

  /// Light Theme Data
  static ThemeData get lightTheme => ThemeData(
        // primary colors
        primaryColor: AppColors.secondaryBackGround,
        // Accent color

        // AppBar Light Theme
        appBarTheme: AppBarTheme(
          titleTextStyle: josefinSansTextStyle.copyWith(
            fontSize: 20,
            color: AppColors.primaryText,
          ),
          backgroundColor: AppColors.primaryBackGround,
          shape: const Border(
            bottom: BorderSide(
              color: AppColors.secondaryTextDark,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        tabBarTheme: _tabBarThemeLight,

        // Scaffold Light theme
        scaffoldBackgroundColor: AppColors.primaryBackGround,
        hintColor: AppColors.secondaryText,

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.secondaryBackGround,
          foregroundColor: AppColors.accent,
        ),
      );

  /// Dark Theme Data
  static ThemeData get darkTheme => lightTheme.copyWith(
        primaryColor: AppColors.secondaryBackGroundDark,

        // AppBar Dark Theme
        appBarTheme: AppBarTheme(
          titleTextStyle: josefinSansTextStyle.copyWith(
            color: AppColors.primaryTextDark,
          ),
          backgroundColor: AppColors.primaryBackGroundDark,
          shape: const Border(
            bottom: BorderSide(
              color: AppColors.secondaryText,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        tabBarTheme: _tabBarThemeLight.copyWith(
          labelColor: AppColors.primaryTextDark,
          unselectedLabelColor: AppColors.secondaryTextDark.withOpacity(.7),
        ),

        // Scaffold Dark theme
        scaffoldBackgroundColor: AppColors.primaryBackGroundDark,
        hintColor: AppColors.secondaryTextDark,
        textTheme: TextTheme(
          titleMedium: josefinSansTextStyle.copyWith(
            color: AppColors.secondaryTextDark,
          ), //<-- SEE HERE
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryIconBackGroundDark,
          foregroundColor: AppColors.accent,
        ),
      );
}
