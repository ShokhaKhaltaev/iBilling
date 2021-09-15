import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceButton extends StatelessWidget {
  final String iconPath;
  final String buttonText;
  final VoidCallback callback;
  InvoiceButton({this.buttonText, this.iconPath, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff4E4E4E),
          borderRadius: BorderRadius.circular(6)
        ),
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/$iconPath', color: Color(0xff00A795),),
            SizedBox(width: 15),
            Text(buttonText, style: TextStyle(fontFamily: 'Ubuntu Medium', fontSize: 16, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
