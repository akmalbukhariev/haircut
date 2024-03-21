import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/booked_info.dart';
import 'main_page_cubit.dart';
import 'main_page_state.dart';

class DayPage extends StatefulWidget{
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPage();
}

class _DayPage extends State<DayPage>{

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
        if(item.services.isNotEmpty){
          color = item.services[0];
        }
        final event = CalendarEventData(
            date: DateFormat(format).parse(startTime),
            startTime: DateFormat(format).parse(startTime),
            endTime: DateFormat(format).parse(endTime),
            event: item.name,
            title: item.name,
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
      builder: (context, state){
        return  SafeArea(
            child: CalendarControllerProvider(
              controller: controller,
              child: DayView(
                initialDay: state.initialDateTime,
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
                onPageChange: (date, index){
                  context.read<MainPageCubit>().updateHeaderDate(date: date);
                },
              ),
            )
        );
      }
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