

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/booked_info.dart';
import '../../widgets/tap_animation_widget.dart';

final bookedList = [
  AppointmentInfo(
      date: "2023.11.12",
      startTime: "9:00",
      endTime: "9:30",
      services: [Colors.yellow],
      strServices: "Soqol olish",
      name: "Ibragimov Jasur",
      phone: "+99897123654" ),
  AppointmentInfo(
      date: "2023.11.12",
      startTime: "10:00",
      endTime: "11:00",
      services: [Colors.pink],
      strServices: "Soch olish",
      name: "Qobilov Ikrom",
      phone: "+99897745845" ),
  AppointmentInfo(
      date: "2023.11.12",
      startTime: "14:00",
      endTime: "15:00",
      services: [Colors.blue],
      strServices: "Ukladka",
      name: "Zokirov Laziz",
      phone: "+99897123654" ),
  AppointmentInfo(
      date: "2023.11.13",
      startTime: "15:00",
      endTime: "17:30",
      services: [Colors.pink, Colors.deepPurple, Colors.yellow],
      strServices: "Soqol olish, Ukladka, Soqol olish",
      name: "Ibragimov Jasur",
      phone: "+99897123654"),
  AppointmentInfo(
      date: "2023.11.13",
      startTime: "14:00",
      endTime: "15:00",
      services: [Colors.pink],
      strServices: "Ukladka",
      name: "Zokirov Laziz",
      phone: "+99897123654" ),
  AppointmentInfo(
      date: "2023.11.14",
      startTime: "14:00",
      endTime: "15:00",
      services: [Colors.blue],
      strServices: "Ukladka",
      name: "Zokirov Laziz",
      phone: "+99897123654" ),
];

class NotificationPage extends StatefulWidget{
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {

  Map<String, List<AppointmentInfo>> groupedBookedMap = {};

  @override
  Widget build(BuildContext context) {
    groupedBookedMap.clear();

    for (var sInfo in bookedList) {
      groupedBookedMap.putIfAbsent(sInfo.date, () => []);
      groupedBookedMap[sInfo.date]!.add(sInfo);
    }
    return Material(
      child: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  createHeader(),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        color: const Color.fromRGBO(240, 244, 249, 1),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            createGrouppedList()
                          ],
                        )
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  Widget createHeader() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("images/icon_1.png", width: 30, height: 30,),
            ),
            Row(
              children: [
                Text("Buyurtmalar", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(17, 138, 178, 1),
                    fontSize: 20
                ),),
                const SizedBox(width: 5,),
                Text("soni", style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 15
                ),),
                const SizedBox(width: 5,),
                Text("4", style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                const SizedBox(width: 5,),
                Text("dona", style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 15
                ),),
              ],
            )
          ],
        )
    );
  }

  Widget createGrouppedList() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
              itemCount: groupedBookedMap.length,
              itemBuilder: (BuildContext context, int index) {
                String groupID = groupedBookedMap.keys.elementAt(index);
                List<AppointmentInfo>? infoList = groupedBookedMap[groupID];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 30,
                            color: const Color.fromRGBO(17, 138, 178, 1),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5),
                              child: Text(
                                groupID,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                        ),
                        const Expanded(child: SizedBox())
                      ],),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: infoList?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return grouppedItem(info: infoList![index]);
                              }
                          ),
                        )
                    ),
                    const SizedBox(height: 25,)
                  ],
                );
              }
          )
      ),
    );
  }

  Widget grouppedItem({required AppointmentInfo info}) {
    Color serviceColor = info.services.isNotEmpty ? info.services[0] : Colors
        .white;
    return Padding(
        padding: const EdgeInsets.only(right: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  color: serviceColor,
                ),
                SizedBox(
                  width: 170,
                  child: Column(
                    children: [
                      createBoldText(strText: info.name),
                      createNormalText(strText: info.strServices),
                      Row(
                        children: [
                          createNormalText(strText: "Soat: "),
                          createBoldText(
                              strText: "${info.startTime} - ${info.endTime}")
                        ],
                      )
                    ],
                  ),
                ),
                //const Expanded(child: SizedBox()),
                Expanded(
                    child: Column(
                      children: [
                        Row(children: [
                          const Expanded(child: SizedBox()),
                          createBoldText(strText: info.phone,
                              alignmentGeometry: Alignment.centerRight),
                        ],),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            TapAnimationWidget(
                              tabWidget: createCircleButton(image: "images/edit_1.png"),
                              onPressedCallBack: (){

                              },
                            ),
                            const SizedBox(width: 4,),
                            TapAnimationWidget(
                              tabWidget: createCircleButton(image: "images/delete_1.png"),
                              onPressedCallBack: (){

                              },
                            ),
                            const SizedBox(width: 4,),
                            TapAnimationWidget(
                              tabWidget: createCircleButton(image: "images/call_1.png"),
                              onPressedCallBack: (){

                              },
                            ),
                            const SizedBox(width: 4,),
                            TapAnimationWidget(
                              tabWidget: createCircleButton(image: "images/check_1.png"),
                              onPressedCallBack: (){

                              },
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(height: 2, color: Colors.grey,),
          ],
        )
    );
  }

  Widget createBoldText(
      {required String strText, AlignmentGeometry alignmentGeometry = Alignment
          .centerLeft}) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(strText,
          style: const TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),)
    );
  }

  Widget createNormalText({required String strText}) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(strText,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontWeight: FontWeight.normal,
              fontSize: 18
          ),)
    );
  }

  //double sc = 1;
  Widget createCircleButton({required String image}) {
     return Image.asset(image, width: 35, height: 35,);
    /*return AnimatedScale(
        scale: sc,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
            onTap: () {
                setState(() {
                   sc == 1 ? sc = 2 : sc = 1;
                });
            },
            child: Image.asset(image, width: 35, height: 35,)
        )
    );*/
  }
}