
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
                const CustomCalendar(),
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 50,
                color: const Color.fromRGBO(242, 249, 253, 1),
                child: Center(
                  child: Column(
                    children: [
                      Text(info.startTime, style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Text(info.startTime, style: const TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold),),
                      const SizedBox(height: 15,)
                    ],
                  ),
                )
            ),
            createColorBar(info.services),
            Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(info.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromRGBO(102, 102, 102, 1)),)
                      ,),
                    const SizedBox(height: 7,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(info.strServices,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color.fromRGBO(102, 102, 102, 1)),)
                      ,),
                  ],
                )
            ),
            Text(info.phone,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromRGBO(102, 102, 102, 1)),)
          ],
        ),
        Container(height: 2, color: const Color.fromRGBO(241, 241, 241, 1),)
      ],
    );
  }

  Widget createColorBar(List<Color> colors)
  {
    return Row(children: colors.map((item) =>
        Container(
          width: 20,
          color: item,
        )
    ).toList());
  }
}