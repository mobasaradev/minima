import 'package:flutter/material.dart';
import 'utils.dart';

class AppThemes {
  AppThemes._();
  
  /// TabBar Light theme
  static final _tabBarThemeLight = TabBarTheme(
    dividerColor: AppColors.transparent,
    dividerHeight: 0,
    labelStyle: const TextStyle(
      fontFamily: "Montserrat",
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 0,
        color: AppColors.transparent,
      ),
    ),
    unselectedLabelColor: AppColors.secondary.withOpacity(0.7),
    unselectedLabelStyle: const TextStyle(
      fontFamily: "Montserrat",
    ),
    labelColor: AppColors.secondary,
  );

  /// Light Theme Data
  static ThemeData get lightTheme => ThemeData(
        // Card icon
        iconTheme: IconThemeData(
          color: AppColors.white.withOpacity(.8),
        ),
        primaryColor: AppColors.secondary,
        canvasColor: AppColors.white,

        // AppBar Light Theme
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.secondary,
          ),
          backgroundColor: AppColors.white,
          shape: Border(
            bottom: BorderSide(
              width: 0,
              color: AppColors.secondary.withOpacity(.8),
            ),
          ),
          elevation: 0,
        ),
        tabBarTheme: _tabBarThemeLight,

        // Scaffold Light theme
        scaffoldBackgroundColor: AppColors.white,
        hintColor: AppColors.grey.withOpacity(0.5),
        // Text theme
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: "Montserrat",
            color: AppColors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.white,
        ),
      );

  // Dark Theme Data
  static ThemeData get darkTheme => lightTheme.copyWith(
        // Card icon
        iconTheme: IconThemeData(
          color: AppColors.white.withOpacity(.8),
        ),
        primaryColor: AppColors.secondaryDark,
        
        // AppBar Dark Theme
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryDark,
          iconTheme: const IconThemeData(color: AppColors.white),
          titleTextStyle: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.secondary.withOpacity(0.6),
              width: 0,
            ),
          ),
          elevation: 0,
        ),
        tabBarTheme: _tabBarThemeLight.copyWith(
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.white.withOpacity(.6),
        ),

        // Scaffold Dark theme
        scaffoldBackgroundColor: AppColors.primaryDark,
        hintColor: AppColors.white.withOpacity(0.6),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: "Montserrat",
            color: AppColors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.secondaryDark,
          foregroundColor: AppColors.white,
        ),
      );
}
