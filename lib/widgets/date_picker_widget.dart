import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime dateText;
  DatePickerWidget({this.dateText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.3,
      height: MediaQuery.of(context).size.height*0.05,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xff2A2A2D),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(DateFormat('dd-MM-yyyy').format(dateText), style: TextStyle(fontSize: 14, color: Color(0xff999999), fontFamily: 'Ubuntu Medium', fontWeight: FontWeight.w500),),
          SvgPicture.asset('assets/icons/Calendar.svg', height: 13, width: 12, color: Color(0xffA5A5A5),)
        ],
      ),
    );
  }
}
