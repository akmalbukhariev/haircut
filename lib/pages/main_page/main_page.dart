
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/booked_info.dart';
import 'custom_calendar.dart';

final bookedList = [
  BookedInfo(
      startTime: "9:00",
      endTime: "9:30",
      services: [Colors.yellow],
      strServices: "Soqol olish",
      name: "Ibragimov Jasur",
      phone: "+99897123654" ),
  BookedInfo(
      startTime: "10:00",
      endTime: "11:00",
      services: [Colors.pink],
      strServices: "Soch olish",
      name: "Qobilov Ikrom",
      phone: "+99897745845" ),
  BookedInfo(
      startTime: "14:00",
      endTime: "15:00",
      services: [Colors.blue],
      strServices: "Ukladka",
      name: "Zokirov Laziz",
      phone: "+99897123654" ),
  BookedInfo(
      startTime: "15:00",
      endTime: "17:30",
      services: [Colors.pink, Colors.deepPurple, Colors.yellow],
      strServices: "Soqol olish, Ukladka, Soqol olish",
      name: "Ibragimov Jasur",
      phone: "+99897123654")
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                createHeader(),
                const SizedBox(height: 20,),
                CustomCalendar(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context,
                              int index) {
                            final item = bookedList[index];
                            return createBookedItem(info: item);
                          },
                          childCount: bookedList.length,
                        ),
                        //shrinkWrap: true,
                      ),
                    ],
                  ),
                ),
              ]
              ,)
        )
    );
  }

  Widget createHeader() {
    final String strMonth = "yanvar";
    final String strYear = "2023";
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            headerImage(image: "images/menu2.png"),
            Row(
              children: [
                Text(strMonth,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const SizedBox(width: 10,),
                Text(strYear,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 20
                  ),
                ),
              ],
            ),
            headerImage(image: "images/notification.png"),
            headerImage(image: "images/search_gray.png"),
            headerImage(image: "images/avatar.png"),
          ],
        )
    );
  }

  Widget headerImage({String image = ""}) {
    return Image.asset(image, width: 30, height: 30,);
  }

  Widget createBookedItem({required BookedInfo info}) {
    return Row(
      children: [
        Container(
          color: const Color.fromRGBO(242, 249, 253, 1),
            child: Center(
              child: Column(
                children: [
                  Text(info.startTime, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Text(info.startTime, style: const TextStyle(color: Color.fromRGBO(102, 102, 102, 1), fontWeight: FontWeight.bold),)
                ],
              ),
            )
        ),

      ],
    );
  }
}