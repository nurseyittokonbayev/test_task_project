import 'package:flutter/material.dart';
import 'package:test_project/theme/app_colors.dart';
import 'package:test_project/theme/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.text,
    required this.hintText,
    required this.prefixIcon,
    this.enabled,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final String text;
  final String? hintText;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: AppTextStyle.roboto14w600,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        TextField(
          onTap: onTap,
          controller: controller,
          readOnly: enabled ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.hintTextColor),
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.hintTextColor,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        )
      ],
    );
  }
}
