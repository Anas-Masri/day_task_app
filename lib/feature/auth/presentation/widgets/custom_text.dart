// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.style,
    this.padding,
    this.alignment = Alignment.topLeft,
  });
  final String text;
  final TextStyle style;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment,
      child: Text(text, style: style),
    );
  }
}
