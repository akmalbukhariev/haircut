
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/content_views/child_widgets.dart';
import 'package:haircut/content_views/tap_animation_widget.dart';
import 'package:haircut/pages/user_pages/hairdresser_page.dart';
import 'package:haircut/pages/user_pages/my_main_page.dart';

import '../../models/hairdresser_info.dart';

class HairdresserListPage extends StatefulWidget{
  const HairdresserListPage({super.key});

  @override
  State<HairdresserListPage> createState() => _HairdresserListPage();
}

const List<String> list = <String>["Menga ma'qullar", "Yqinda joylashganlar", "Reytingi yuqorilari", "Ayni"];

final hairdresserInfoList = [
  HairdresserInfo(
      image: "images/avatar_4.png",
      starCount: 3.3,
      phone: "+9987542145",
      name: "Akmal Buxariev",
      services: "Soch olish, Stilis",
      address: "Yunus obod",
      favorate: true),
  HairdresserInfo(
      image: "images/avatar_1.png",
      starCount: 4.6,
      phone: "+99879542145",
      name: "Zokirov Sherzod",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Kokcha",
      favorate: true),
  HairdresserInfo(
      image: "images/avatar_2.png",
      starCount: 2.5,
      phone: "+99879542100",
      name: "Iskandarova Muxlisa",
      services: "Massajist, Stilis",
      address: "Chilonzor,",
      favorate: false),
  HairdresserInfo(
      image: "images/avatar_3.png",
      starCount: 1.6,
      phone: "+99878542875",
      name: "Suyunov Jasur",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Bobur mahallasi",
      favorate: false),
  HairdresserInfo(
      image: "images/avatar_3.png",
      starCount: 1.6,
      phone: "+99878542875",
      name: "Suyunov Jasur",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Bobur mahallasi",
      favorate: false),
  HairdresserInfo(
      image: "images/avatar_3.png",
      starCount: 1.6,
      phone: "+99878542875",
      name: "Suyunov Jasur",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Bobur mahallasi",
      favorate: false),
  HairdresserInfo(
      image: "images/avatar_3.png",
      starCount: 1.6,
      phone: "+99878542875",
      name: "Suyunov Jasur",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Bobur mahallasi",
      favorate: false),
  HairdresserInfo(
      image: "images/avatar_3.png",
      starCount: 1.6,
      phone: "+99878542875",
      name: "Suyunov Jasur",
      services: "Kosmetolog, Stilis",
      address: "Toshkent shaxar, Bobur mahallasi",
      favorate: false),
];

class _HairdresserListPage extends State<HairdresserListPage> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: const Color.fromRGBO(240, 244, 249, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: searchTextField()),
                      const SizedBox(width: 10,),
                      Image.asset("images/bell.png", width: 30, height: 30,)
                    ],
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: Image.asset(
                      "images/comboBox.png", width: 15, height: 15,),
                    //const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Color.fromRGBO(17, 138, 178, 1)),
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: hairdresserInfoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TapAnimationWidget(
                              tabWidget: createItem(info: hairdresserInfoList[index]),
                              onPressedCallBack: (){
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) => HairdresserPage()),
                                );
                            },
                          );
                        }
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

  Widget createItem({required HairdresserInfo info}) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Expanded(child:
                Image.asset(info.image )),
                SizedBox(
                    width: 250,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 0, bottom: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                /*Column(
                                  children: [
                                    Row(
                                      children: [
                                        createText(text: info.starCount.toString()),
                                        Image.asset("images/icon_13.png", width: 15, height: 15,),
                                        createText(text: "Ph: ${info.phone}"),
                                      ],),
                                    Container(color: Colors.grey, height: 2, width: 20,),
                                  ],
                                ),*/
                                Row(
                                  children: [
                                    createText(text: info.starCount
                                        .toString()),
                                    Image.asset(
                                      "images/icon_13.png", width: 15,
                                      height: 15,)
                                  ],
                                ),
                                createText(text: "Ph: ${info.phone}"),
                                const SizedBox(width: 0,),
                                TapAnimationWidget(
                                  tabWidget: Image.asset(
                                    "images/heart.png", width: 20, height: 20,),
                                  onPressedCallBack: () {

                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Expanded(
                                    child:Container(
                                      color: const Color.fromRGBO(232, 232, 232, 1),
                                      height: 1,
                                    ),
                                ), const SizedBox(width: 50,)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            createText(text: info.name,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            const SizedBox(height: 5,),
                            createText(text: info.services),
                            const SizedBox(height: 3,),
                            createText(text: info.address)
                          ],
                        )
                    )
                )
              ],
            ),
          ),
          const SizedBox(height: 20,)
        ]
    );
  }

  Widget createText({required String text, FontWeight fontWeight = FontWeight
      .normal, Color color = const Color.fromRGBO(112, 112, 112, 1)}) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: 17
          ),)
    );
  }
}