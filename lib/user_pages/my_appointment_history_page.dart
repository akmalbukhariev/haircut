
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/booked_info.dart';

final bookedList = [
  BookedInfo(name: "Alisher Ortikov", strServices: "Sartarosh, Stilis", services: [Colors.yellow], date: "01.01.2023",startTime: "9:00",  endTime: "9:30"),
  BookedInfo(name: "Zarina Zokirova", strServices: "Kosmetologiya, Depilatsiya", services: [Colors.pink], date: "02.02.2023",startTime: "10:00",  endTime: "11:30"),
  BookedInfo(name: "Rustam Azizov", strServices: "Sartarosh, Stilis", services: [Colors.deepPurple, Colors.yellow], date: "02.02.2023",startTime: "12:00",  endTime: "13:30"),
  BookedInfo(name: "Zokir Erkinov", strServices: "Sartarosh, Stilis", services: [Colors.deepPurple, Colors.yellow,Colors.red], date: "03.03.2023",startTime: "14:00",  endTime: "14:40"),
  BookedInfo(name: "Alisher Ortikov", strServices: "Sartarosh, Stilis", services: [Colors.yellow], date: "01.01.2023",startTime: "9:00",  endTime: "9:30"),
  BookedInfo(name: "Zarina Zokirova", strServices: "Kosmetologiya, Depilatsiya", services: [Colors.pink], date: "02.02.2023",startTime: "10:00",  endTime: "11:30"),
  BookedInfo(name: "Rustam Azizov", strServices: "Sartarosh, Stilis", services: [Colors.deepPurple, Colors.yellow], date: "02.02.2023",startTime: "12:00",  endTime: "13:30"),
  BookedInfo(name: "Zokir Erkinov", strServices: "Sartarosh, Stilis", services: [Colors.lightGreen, Colors.yellow,Colors.red], date: "03.03.2023",startTime: "14:00",  endTime: "14:40"),
  BookedInfo(name: "Alisher Ortikov", strServices: "Sartarosh, Stilis", services: [Colors.yellow], date: "01.01.2023",startTime: "9:00",  endTime: "9:30"),
  BookedInfo(name: "Zarina Zokirova", strServices: "Kosmetologiya, Depilatsiya", services: [Colors.pink], date: "02.02.2023",startTime: "10:00",  endTime: "11:30"),
  BookedInfo(name: "Rustam Azizov", strServices: "Sartarosh, Stilis", services: [Colors.red, Colors.yellow], date: "02.02.2023",startTime: "12:00",  endTime: "13:30"),
  BookedInfo(name: "Zokir Erkinov", strServices: "Sartarosh, Stilis", services: [Colors.deepPurple, Colors.yellow,Colors.red], date: "03.03.2023",startTime: "14:00",  endTime: "14:40"),
  BookedInfo(name: "Alisher Ortikov", strServices: "Sartarosh, Stilis", services: [Colors.yellow], date: "01.01.2023",startTime: "9:00",  endTime: "9:30"),
  BookedInfo(name: "Zarina Zokirova", strServices: "Kosmetologiya, Depilatsiya", services: [Colors.black], date: "02.02.2023",startTime: "10:00",  endTime: "11:30"),
  BookedInfo(name: "Rustam Azizov", strServices: "Sartarosh, Stilis", services: [Colors.deepPurple, Colors.limeAccent], date: "02.02.2023",startTime: "12:00",  endTime: "13:30"),
  BookedInfo(name: "Zokir Erkinov", strServices: "Sartarosh, Stilis", services: [Colors.lightBlue, Colors.yellow,Colors.red], date: "03.03.2023",startTime: "14:00",  endTime: "14:40"),
];

class MyAppointmentHistoryPage extends StatefulWidget{
  const MyAppointmentHistoryPage({super.key});

  @override
  State<MyAppointmentHistoryPage> createState() => _MyAppointmentHistoryPage();
}

class _MyAppointmentHistoryPage extends State<MyAppointmentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
          child: SafeArea(
              child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      createHeader(),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                color: const Color.fromRGBO(240, 244, 249, 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      //borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: bookedList.length,
                                      itemBuilder: (context, index) {
                                        return createItem(info: bookedList[index]);
                                      }
                                  )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
          )
      ),
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 10),
      child: Text("Mening buyurtmalarim tarixi", style: const TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),
      )
      /*Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/icon_1.png", width: 25, height: 25,),
          ),
          const SizedBox(width: 10,),
          Text("Mening buyurtmalarim tarixi", style: const TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),
          )
        ],
      ),*/
    );
  }

  Widget createItem({required BookedInfo info}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 60,
              color: info.services[0],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(info.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(102, 102, 102, 1)),),
                            Text(info.date, style: const TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1)),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(info.strServices, style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(102, 102, 102, 1)),),
                            Text("${info.startTime}-${info.endTime}",
                              style: const TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1)),),
                          ],
                        ),
                      ],
                    )
                )
            )
          ],
        ),
        const Divider(height: 2, color: Color.fromRGBO(241, 241, 241, 1),)
      ],) ;
  }
}