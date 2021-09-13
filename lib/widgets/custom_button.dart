import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;

  CustomButton({this.buttonText, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff00A795),
          borderRadius: BorderRadius.circular(6)
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(buttonText,
            style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu Medium', fontSize: 14, fontWeight: FontWeight.w700),
          )
      ),
    );
  }
}
