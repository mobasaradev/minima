import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  /// TabBar Light theme
  static final _tabBarThemeLight = TabBarTheme(
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 0, color: AppColors.transparent),
    ),
    unselectedLabelColor: AppColors.secondaryText.withOpacity(.7),
    labelColor: AppColors.primaryText,
  );

  /// Light Theme Data
  static ThemeData get lightTheme => ThemeData(
        // AppBar Light Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBackGround,
          foregroundColor: AppColors.primaryText,
          shape: Border(
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
          foregroundColor: AppColors.primaryIcon,
        ),
      );

  /// Dark Theme Data
  static ThemeData get darkTheme => lightTheme.copyWith(
        // AppBar Dark Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryBackGroundDark,
          foregroundColor: AppColors.primaryTextDark,
          shape: Border(
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
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: AppColors.secondaryTextDark,
          ), //<-- SEE HERE
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryIconBackGroundDark,
          foregroundColor: AppColors.primaryIcon,
        ),
        
      );
}
