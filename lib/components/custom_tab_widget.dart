// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_project/theme/app_colors.dart';
import 'package:test_project/theme/text_style.dart';

class CustomTabWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const CustomTabWidget({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        decoration: BoxDecoration(
          color:
              isActive ? AppColors.btnActiveColor : AppColors.btnDeActiveColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyle.roboto14w400,
          ),
        ),
      ),
    );
  }
}
