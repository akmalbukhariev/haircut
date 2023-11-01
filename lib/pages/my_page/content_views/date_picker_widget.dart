
import 'package:flutter/cupertino.dart';

class DatePickerWidget extends StatefulWidget{
   const DatePickerWidget({super.key, required this.title});

   final String title;
   
  @override
  State<StatefulWidget> createState() => _DatePickerWidget();
}

class _DatePickerWidget extends State<DatePickerWidget> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(widget.title,
            style: const TextStyle(
                color: Color.fromRGBO(17, 138, 178, 1),
                fontSize: 15),
          ),
          Expanded(
              child: CupertinoDatePicker(
                itemExtent: 50,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: _selectedTime,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    _selectedTime = newTime;
                  });
                },
              )
          )
        ],
      );
  }
}