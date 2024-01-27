
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content_views/clean_button_textfield.dart';
import '../../models/my_service.dart';

final serviceList = [
  MyService(color: Colors.deepPurple, text: "Ukladka", price: "50,000 so'm"),
  MyService(color: Colors.red, text: "Soch bo'yash", price: "10,000 so'm"),
  MyService(color: Colors.blue, text: "Soqol olish", price: "120,000 so'm"),
  MyService(color: Colors.yellow, text: "Soch olish", price: "80,000 so'm"),
  MyService(color: Colors.blueGrey, text: "Soch olish", price: "8,000 so'm"),
  MyService(color: Colors.grey, text: "Soch olish", price: "5,000 so'm"),
];

class MakeAppointmentPage extends StatefulWidget{
  const MakeAppointmentPage({super.key});

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPage();
}

class _MakeAppointmentPage extends State<MakeAppointmentPage>{

  DateTime _selectedStartTime = DateTime.now();
  DateTime _selectedEndTime = DateTime.now();

  late final TextEditingController controlTextField;

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
                    child: Container(
                      color: const Color.fromRGBO(240, 244, 249, 1),
                      child: SingleChildScrollView(
                        child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: createInfo1(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: createInfo2(),
                            ),
                          ),
                        ],
                      )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/icon_1.png", width: 30, height: 30,),
          ),
          const Expanded(child: SizedBox()),
          const Text("Qabulga yozilish",style: TextStyle(color: Colors.red, fontSize: 25),
          )
        ],
      ),
    );
  }

  Widget createInfo1() {


    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                CleanButtonTextField(
                  controlTextField: this.controlTextField,
                  placeHolder: "Ismingizni kiriting",),
                const Divider(
                  height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
                CleanButtonTextField(
                  controlTextField: this.controlTextField,
                  placeHolder: "Telefon raqamingizni kiriting",),
                const Divider(
                  height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
              ],
            )
        ),
        ExpansionTile(
            title: const Text(
              "Xizmat turlari",
              style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontWeight: FontWeight.normal,
                fontSize: 17,
              ),
            ),
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: serviceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20),
                        child: itemService(service: serviceList[index])
                    );
                  },
                ),
              ),
            ]
        ),
      ],
    );
  }

  Widget createInfo2() {
    String strStartDate = "${_selectedStartTime.day}.${_selectedStartTime
        .month}.${_selectedStartTime.year}y.";
    String strStartTime = "${_selectedStartTime.hour}:${_selectedStartTime
        .minute}";

    String strEndDate = "${_selectedEndTime.day}.${_selectedEndTime
        .month}.${_selectedEndTime.year}y.";
    String strEndTime = "${_selectedEndTime.hour}:${_selectedEndTime.minute}";

    return Column(
      children: [
        createDateTime(title: "Boshlanish vaqti", time1: strStartDate, time2: strStartTime, isStartDate: true),
        const Padding(
          padding: EdgeInsets.only(left: 15,),
          child: Divider(height: 0.5, color: Color.fromRGBO(167, 167, 167, 1),),
        ),
        createDateTime(title: "Tugash vaqti", time1: strEndDate, time2: strEndTime )
      ],
    );
  }

  Widget createDateTime({required String title, required String time1, required String time2, bool isStartDate = false}){
    return ExpansionTile(
      title: Text(title,
        style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1)),),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: [
            Text(time1,
              style: const TextStyle(color: Color.fromRGBO(17, 138, 178, 1)),),
            Text(time2,
              style: const TextStyle(color: Color.fromRGBO(17, 138, 178, 1),fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      children: [
        SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              itemExtent: 50,
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: isStartDate? _selectedStartTime : _selectedEndTime,
              use24hFormat: true,
              onDateTimeChanged: (DateTime newTime) {
                setState(() {
                  if(isStartDate){
                    _selectedStartTime = newTime;
                  }
                  else{
                    _selectedEndTime = newTime;
                  }
                });
              },
            )
        ),
      ],
    );
  }

  Widget itemService({required MyService service}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: service.color,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                const SizedBox(width: 10,),
                createText(text: service.text)
              ],
            ),
            createText(text: service.price)
          ],
        ),
        const SizedBox(height: 5,),
        Container(height: 1, color: const Color.fromRGBO(240, 240, 240, 1),),
        const SizedBox(height: 10,)
      ],
    );
  }

  Widget createText({required String text, FontWeight fontWeight = FontWeight.normal,Color color = const Color.fromRGBO(102, 102, 102, 1),textOverflow = TextOverflow.ellipsis}) {
    return Text(text,
      overflow: textOverflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 17),
    );
  }
}