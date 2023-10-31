import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.style,
    this.color,
    required this.horizontal,
    required this.vertical,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Color? color;
  final double horizontal;
  final double vertical;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: Center(
            child: Text(
              text,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
