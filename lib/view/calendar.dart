import 'package:flutter/material.dart';

//日历
class CalendarView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        _datePicker1()

      ],),
    );
  }

  Column _datePicker1() {
    return Column(
        children: [
          Text('日历选择器1'),
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 300,
            child: CalendarDatePicker(initialDate: DateTime.now(),
                firstDate: DateTime(1994),
                lastDate: DateTime(2099),
                onDateChanged: (dateSelected) {
                  print(dateSelected);
                }),
          )
        ],
      );
  }


}
