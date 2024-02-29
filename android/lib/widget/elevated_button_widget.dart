import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
