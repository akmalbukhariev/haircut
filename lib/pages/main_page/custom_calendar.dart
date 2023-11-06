
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/models/booked_info.dart';

import '../../models/calendar_day.dart';

enum ButtonId {
  None,
  Btn1,
  Btn2,
  Btn3,
  Btn4,
  Btn5,
  Btn6,
  Btn7,
  Btn8,
  Btn9,
  Btn10,
  Btn11,
  Btn12,
  Btn13,
  Btn14,
  Btn15,
  Btn16,
  Btn17,
  Btn18,
  Btn19,
  Btn20,
  Btn21,
  Btn22,
  Btn23,
  Btn24,
  Btn25,
  Btn26,
  Btn27,
  Btn28,
  Btn29,
  Btn30,
  Btn31,
  Btn32,
  Btn33,
  Btn34,
  Btn35,
  Btn36,
  Btn37,
  Btn38,
  Btn39,
  Btn40,
  Btn41,
  Btn42
}

enum MonthId{
  previousMonth,
  thisMonth,
  nextMonth
}

class CustomCalendar extends StatefulWidget{
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendar();
}

class _CustomCalendar extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            dayName(name: "Du"),
            dayName(name: "Se"),
            dayName(name: "Ch"),
            dayName(name: "Pa"),
            dayName(name: "Ju"),
            dayName(name: "Sh", isWeekend: true),
            dayName(name: "Ya", isWeekend: true),
          ],
        ),
        const SizedBox(height: 5,),
        Container(
          color: const Color.fromRGBO(249, 249, 249, 1),
          child: Column(
            children: [
              Container(
                  height: 2, color: const Color.fromRGBO(222, 222, 222, 1)),
              rowNumber(
                  day1: DayInfo(isBusy: true),
                  day2: DayInfo(isBusy: true, text: "2"),
                  day3: DayInfo(isBusy: true, text: "3"),
                  day4: DayInfo(isBusy: true, text: "4"),
                  day5: DayInfo(isBusy: true, isWeekend: true, text: "5"),
                  day6: DayInfo(isBusy: true, isWeekend: true, text: "6"),
                  day7: DayInfo(isBusy: true, text: "7")),
              Container(
                  height: 2, color: const Color.fromRGBO(222, 222, 222, 1)),
              rowNumber(
                  day1: DayInfo(isBusy: true, text: "8"),
                  day2: DayInfo(isBusy: true, text: "9"),
                  day3: DayInfo(isBusy: true, isSelected: true, text: "10"),
                  day4: DayInfo(text: "11"),
                  day5: DayInfo(text: "12"),
                  day6: DayInfo(isWeekend: true, text: "13"),
                  day7: DayInfo(isWeekend: true, text: "14")),
              Container(
                  height: 2, color: const Color.fromRGBO(222, 222, 222, 1)),
              rowNumber(
                  day1: DayInfo(text: "15"),
                  day2: DayInfo(text: "16"),
                  day3: DayInfo(text: "17"),
                  day4: DayInfo(text: "18"),
                  day5: DayInfo(isSelected: true, text: "19"),
                  day6: DayInfo(isWeekend: true, text: "20"),
                  day7: DayInfo(isWeekend: true, text: "21")),
              Container(
                  height: 2, color: const Color.fromRGBO(222, 222, 222, 1)),
              rowNumber(
                  day1: DayInfo(text: "22"),
                  day2: DayInfo(text: "23"),
                  day3: DayInfo(text: "24"),
                  day4: DayInfo(text: "25"),
                  day5: DayInfo(text: "26"),
                  day6: DayInfo(isWeekend: true, text: "27"),
                  day7: DayInfo(isWeekend: true, text: "28")),
              Container(
                  height: 2, color: const Color.fromRGBO(222, 222, 222, 1)),
              rowNumber(
                  day1: DayInfo(text: "29"),
                  day2: DayInfo(text: "30"),
                  day3: DayInfo(text: "31"),
                  day4: DayInfo(text: ""),
                  day5: DayInfo(text: ""),
                  day6: DayInfo(text: ""),
                  day7: DayInfo(text: "")),
            ],
          ),
        ),
      ],
    );
  }

  Widget dayName({String name = "", bool isWeekend = false}) {
    return Text(name,
      style: TextStyle(
          fontSize: 20,
          color: isWeekend
              ? const Color.fromRGBO(166, 136, 136, 1)
              : const Color.fromRGBO(128, 128, 128, 1)
      ),
    );
  }

  Widget rowNumber({
    required DayInfo day1,
    required DayInfo day2,
    required DayInfo day3,
    required DayInfo day4,
    required DayInfo day5,
    required DayInfo day6,
    required DayInfo day7,}) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            createDay(info: day1),
            createDay(info: day2),
            createDay(info: day3),
            createDay(info: day4),
            createDay(info: day5),
            createDay(info: day6),
            createDay(info: day7),
          ],
        )
    );
  }

  Widget createDay({required DayInfo info}) {
    Color textColor = Colors.black;
    if (info.isToday) {
      textColor = const Color.fromRGBO(180, 53, 53, 1);
    } else if (info.isWeekend) {
      textColor = const Color.fromRGBO(128, 128, 128, 1);
    } else if (info.isSelected) {
      textColor = Colors.white;
    }

    if (info.isBusy && !info.isSelected) {
      return SizedBox(
          width: 40,
          height: 40,
          child: Column(
            children: [
              Text(
                info.text, style: TextStyle(color: textColor, fontSize: 20),),
              const SizedBox(height: 5,),
              Image.asset("images/icon_18.png", width: 10, height: 10,)
            ],
          )
      );
    }
    else if (!info.isBusy && !info.isSelected) {
      return SizedBox(
          width: 40,
          height: 40,
          child: Column(
            children: [
              Text(
                info.text, style: TextStyle(color: textColor, fontSize: 20),),
              const SizedBox(width: 15, height: 15,),
            ],
          )
      );
    }
    else if (info.isSelected) {
      return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(250, 154, 147, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.red)
          ),
          child: info.isBusy ?
          Column(
            children: [
              Text(
                info.text, style: TextStyle(color: textColor, fontSize: 20),),
              const SizedBox(height: 5,),
              Image.asset("images/icon_18.png", width: 10, height: 10,)
            ],
          ) :
          Column(
            children: [
              Text(
                info.text, style: TextStyle(color: textColor, fontSize: 20),),
              //const SizedBox(width: 15, height: 15,),
            ],
          )
      );
    }
    return widget;
  }
}