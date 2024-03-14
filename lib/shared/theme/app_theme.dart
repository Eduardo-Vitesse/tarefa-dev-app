import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final defaultTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
    ),
  );
}
