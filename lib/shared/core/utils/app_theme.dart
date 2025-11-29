import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static TextStyle headLineBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );
  static TextStyle h2Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );
  static TextStyle h3Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );
  static TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.secondary.withAlpha(150),
  );
}
