
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget{
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPage();
}

class _DayPage extends State<DayPage>{

  EventController controller = EventController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CalendarControllerProvider(
          controller: controller,
          child: DayView(
            headerStyle: const HeaderStyle(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 1)
              ),
              headerTextStyle: TextStyle(
                  color: Color.fromRGBO(17, 138, 178, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 0.0),
              rightIconVisible: false,
              leftIconVisible: false,
              headerPadding: EdgeInsets.only(top: 20),
            ),
            timeStringBuilder: (DateTime time, {DateTime? secondaryDate}){
              return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
            },
            dateStringBuilder: (DateTime time, {DateTime? secondaryDate}){
              return "";
            },
            liveTimeIndicatorSettings: const HourIndicatorSettings(color: Colors.red),
            halfHourIndicatorSettings: const HourIndicatorSettings(
                color: Color.fromRGBO(240, 240, 240, 1),
            lineStyle: LineStyle.dashed
            ),
            showHalfHours: true,
            heightPerMinute: 1.5,
          ),
        )
    );
  }
}

//DayView()
/*WeekView(
          weekDayStringBuilder: (int index) {
            final day = ['Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sh', 'Ya'];
            return day[index];
          },
          timeLineStringBuilder: (DateTime time, {DateTime? secondaryDate}) {
            return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
          },
        )*/