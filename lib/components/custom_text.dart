import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.label,
      this.fontWeight,
      this.fontSize,
      this.color});

  final String label;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;

  const CustomText.custom(
      {super.key,
      this.fontSize = 18,
      this.fontWeight = FontWeight.bold,
      this.label = 'label',
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
