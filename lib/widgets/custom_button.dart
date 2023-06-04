import 'package:flutter/material.dart';

import '../consts/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  final TextStyle style;
  final ButtonStyle buttonStyle;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.style,
      required this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
