
import 'dart:ui';

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//import 'package:calendar_view/src/style/header_style.dart';
//import 'package:table_calendar/src/customization/header_style.dart';

import '../../content_views/child_widgets.dart';

@immutable
class Event {
  final String title;

  const Event({this.title = "Title"});

  @override
  bool operator ==(Object other) => other is Event && title == other.title;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() => title;
}

class MyCustomCell extends StatelessWidget {
  final DateTime date;
  final List<CalendarEventData<Object>> events;
  final bool isToday;
  final bool isInMonth;

  const MyCustomCell({
    required this.date,
    required this.events,
    required this.isToday,
    required this.isInMonth,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: isToday ? Colors.blue : (isInMonth ? Colors.white : Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date.day.toString()),
          // Display your events or other content here
        ],
      ),
    );
  }
}

List<CalendarEventData<Event>> _events = [
  CalendarEventData(
    date: DateTime(2023, 11, 15),
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    //startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    //endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
];

CalendarEventData<Event> _event = CalendarEventData(
  date: DateTime(2023, 11, 14),
  startTime: DateTime(2023, 11, 14,2, 20,30),
  endTime: DateTime(2023, 11, 14,5, 20,30),
  //endDate: DateTime(2023, 11, 17),
  event: Event(title: "Joe's Birthday"),
  title: "PPPPP",
  
  description: "Today is project meeting.",
  //startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
  //endTime: DateTime(_now.year, _now.month, _now.day, 22),
);

class WeekPage extends StatefulWidget{
  @override
  State<WeekPage> createState()  => _WeekPage();
}

class _WeekPage extends State<WeekPage> {

  EventController controller = EventController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CalendarControllerProvider(
          controller: controller,
          child: WeekView(
            initialDay: DateTime(2023, 11, 12),
            headerStyle: const HeaderStyle(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1)
              ),
              headerTextStyle: TextStyle(
                  color: Color.fromRGBO(17, 138, 178, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 0.1),
              rightIconVisible: false,
              leftIconVisible: false,
              headerPadding: EdgeInsets.only(top: 1),
            ),
            weekDayStringBuilder: (int index) {
              final day = [
                'Du',
                'Se',
                'Ch',
                'Pa',
                'Ju',
                'Sh',
                'Ya'
              ];
              return day[index];
            },
            timeLineStringBuilder: (DateTime time, {DateTime? secondaryDate}) {
              return '${time.hour}:${time.minute.toString().padLeft( 2, '0')}';
            },
            headerStringBuilder: (DateTime time,{DateTime? secondaryDate}){
              return "";
            },
            liveTimeIndicatorSettings: const HourIndicatorSettings(color: Colors.red),
            showLiveTimeLineInAllDays: true,
            //heightPerMinute: 1.5,
          ),
        )
    );
  }
}