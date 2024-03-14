import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static final heading = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static final subtitle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static final popupTitle = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static final popupDropDown = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );

  static final description = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );

  static final headerText = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );

  static final buttonTextSmall = GoogleFonts.inter(
    // fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  static final buttonTextRegular = GoogleFonts.inter(
    // fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.background,
  );

  static final userName = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static final link = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static final inputLabelText = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey250,
  );
}
