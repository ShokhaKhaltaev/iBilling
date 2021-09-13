import 'package:flutter/material.dart';
import 'package:ibilling_app/widgets/custom_button.dart';

class CustomRowModel {
  bool selected;
  String imagePath;
  String title;
  CustomRowModel({this.selected, this.title, this.imagePath});
}

class CustomRow extends StatelessWidget {
  final CustomRowModel model;
  CustomRow(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      //margin between each language
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
// I have used my own CustomText class to customise TextWidget.
        Row(
          children: [
            Image.asset('${model.imagePath}', height: 54, width: 54),
            SizedBox(width: 13),
            Text(model.title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Ubuntu Regular'),),
          ],
        ),
        this.model.selected
            ? Icon(
          Icons.radio_button_checked,
          color: Color(0xff008F7F),
        )
            : Icon(Icons.radio_button_unchecked, color: Color(0xffA6A6A6),),
      ],
    );
  }
}
