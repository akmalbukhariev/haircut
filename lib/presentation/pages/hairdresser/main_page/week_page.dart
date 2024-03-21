import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/booked_info.dart';
import 'main_page_cubit.dart';
import 'main_page_state.dart';

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

class WeekPage extends StatefulWidget{
  @override
  State<WeekPage> createState()  => _WeekPage();
}

class _WeekPage extends State<WeekPage> {

  EventController controller = EventController();

  @override
  void initState() {
    List<AppointmentInfo>? appointmentList = context.read<MainPageCubit>().state.appointmentList;
    if(appointmentList != null) {
      for (AppointmentInfo item in appointmentList) {
        String format = 'dd.MM.yyyy HH:mm';
        String startTime = "${item.date} ${item.startTime}";
        String endTime = "${item.date} ${item.endTime}";
        Color color = Color(0xff2196f3);
        if(item.services.length > 0){
          color = item.services[0];
        }
        final event = CalendarEventData(
          date: DateFormat(format).parse(startTime),
          startTime: DateFormat(format).parse(startTime),
          endTime: DateFormat(format).parse(endTime),
          event: item.name[0],
          title: item.name[0],
          color: color
        );
        controller.add(event);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return SafeArea(
            child: CalendarControllerProvider(
              controller: controller,
              child: WeekView(
                initialDay: state.initialDateTime,
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
                onPageChange: (date, index){
                  context.read<MainPageCubit>().updateHeaderDate(date: date);
                },
                //heightPerMinute: 1.5,
              ),
            )
        );
      },
    );
  }
}