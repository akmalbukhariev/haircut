
import 'package:flutter/cupertino.dart';

class DatePickerWidget extends StatefulWidget{
   const DatePickerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DatePickerWidget();
}

class _DatePickerWidget extends State<DatePickerWidget>{
  DateTime time = DateTime(2016, 5, 10, 22, 35);

  @override
  Widget build(BuildContext context) {
    return Container();//CupertinoDatePicker()
  }
}