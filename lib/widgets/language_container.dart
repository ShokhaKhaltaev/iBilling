import 'package:flutter/material.dart';

class LanguageContainer extends StatefulWidget {
  @override
  _LanguageContainerState createState() => _LanguageContainerState();
}

class _LanguageContainerState extends State<LanguageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.06,
      decoration: BoxDecoration(
        color: Color(0xff2A2A2D),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('English (USA)', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Ubuntu Regular')),
          Image.asset('assets/images/logo.png', height: 54,width: 54),
        ],
      ),
    );
  }
}
