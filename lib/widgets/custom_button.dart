import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;
  final Color buttonColor;

  CustomButton({this.buttonText, this.onPressed, this.color, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6)
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(buttonText,
            style: TextStyle(color: buttonColor, fontFamily: 'Ubuntu Medium', fontSize: 14, fontWeight: FontWeight.w700),
          )
      ),
    );
  }
}
