import 'package:flutter/material.dart';
import 'package:test_project/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle sFPro16w400 = const TextStyle(
    color: AppColors.appBarTextColor,
    fontSize: 16,
    fontFamily: 'SF Pro',
    fontWeight: FontWeight.w400,
    height: 0,
    letterSpacing: 0.16,
  );

  static TextStyle roboto20w600 = const TextStyle(
    color: AppColors.appBarTextColor,
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static TextStyle roboto16w700 = const TextStyle(
    color: AppColors.appBarTextColor,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    height: 0.08,
  );

  static TextStyle roboto14w600 = const TextStyle(
    color: AppColors.appBarTextColor,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    height: 0.07,
  );

  static TextStyle roboto16w500BtnAsctiveColor = const TextStyle(
    color: AppColors.btnActiveColor,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: 0.06,
  );

  static TextStyle roboto16w500White = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: 0.06,
  );

  static TextStyle roboto14w600White = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    height: 0.07,
  );

  static TextStyle roboto14w400withColor = const TextStyle(
    color: AppColors.selectedAdressTextColor,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 0.10,
  );

  static TextStyle roboto14w400 = const TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 0.10,
  );
}
