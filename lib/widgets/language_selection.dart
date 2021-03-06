import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ibilling_app/constants.dart';
import 'custom_button.dart';
import 'my_dialog_content.dart';

class LanguageSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LanguageSelectionState();
  }
}
class LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      alignment: Alignment.center,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          elevation: 25.0,
          backgroundColor: Color(0xff2A2A2D),
          child: dialogContent(context),
        ),
      ),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    height: 280,
    padding: EdgeInsets.only(top: 20, left: 26, right: 26, bottom: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            color: AppColors.cardGrey,
            child:  Text('Choose a language', style: TextStyle(fontFamily: 'Ubuntu Medium', fontSize: 16, fontWeight: FontWeight.w700))
        ),
        Flexible(
          child: new MyDialogContent(),//Custom ListView
        ),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  buttonText: 'Cancel',
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: Color(0xff008F7F),
                  buttonColor: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  buttonText: 'Done',
                  onPressed: (){},
                  color: Color(0xff008F7F),
                  buttonColor: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}