import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isIcon;

  FormTextField({this.controller, this.isIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        filled: true,
        fillColor: Colors.transparent,
        suffixIcon: isIcon ?
          Image.asset('assets/icons/question.png', height: 17, width: 17)
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF1F1F1), width: 2)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff2A2A2D), width: 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
    );
  }
}
