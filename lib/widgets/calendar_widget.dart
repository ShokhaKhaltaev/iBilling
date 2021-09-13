import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      showYears: false,
      initialDate: _selectedDate,
      firstDate: DateTime(2020, 01, 01),
      lastDate: DateTime.now().add(Duration(days: 365)),
      onDateSelected: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      leftMargin: 0,
      monthColor: Color(0xffDADADA),
      dayColor: Color(0xffD1D1D1),
      dayNameColor: Color(0xFFD1D1D1),
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Color(0xff00A795),
      dotsColor: Color(0xFF333A47),
      selectableDayPredicate: (date) => date.day != 23,
      locale: 'en',
    );
  }
}
