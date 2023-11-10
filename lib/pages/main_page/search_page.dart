
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/models/search_info.dart';

import '../../content_views/child_widgets.dart';
import '../../content_views/clean_button_textfield.dart';

final searchInfoList = [
  SearchInfo(
      date: "03.01.2023",
      startTime: "12:00",
      endTime: "13:00",
      services: [Colors.yellow],
      name: "Islomjonov Karimov",
      strServices: "Soch olish",
      phone: "+998978564201"),
  SearchInfo(
      date: "03.01.2023",
      startTime: "13:00",
      endTime: "14:00",
      services: [Colors.yellow],
      name: "Akromov Dilshod",
      strServices: "Soch olish",
      phone: "+998978764401"),
  SearchInfo(
      date: "03.01.2023",
      startTime: "14:00",
      endTime: "15:00",
      services: [Colors.yellow],
      name: "Eshonqulov Jasur",
      strServices: "Soch olish",
      phone: "+998979967801"),
  SearchInfo(
      date: "04.01.2023",
      startTime: "09:00",
      endTime: "10:00",
      services: [Colors.yellow],
      name: "Toxir Sodiqov",
      strServices: "Soch olish",
      phone: "+998979117881"),
  SearchInfo(
      date: "04.01.2023",
      startTime: "10:00",
      endTime: "11:00",
      services: [Colors.yellow],
      name: "Zokir Erkinov",
      strServices: "Soch olish",
      phone: "+998979917563"),
  SearchInfo(
      date: "05.01.2023",
      startTime: "10:00",
      endTime: "11:00",
      services: [Colors.yellow],
      name: "Muminov Zokir",
      strServices: "Soch olish",
      phone: "+998974217613"),
];

Map<String, List<SearchInfo>> groupedSearchMap = {};

class SearchPage extends StatefulWidget{
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {

    for (var sInfo in searchInfoList) {
      groupedSearchMap.putIfAbsent(sInfo.date, () => []);
      groupedSearchMap[sInfo.date]!.add(sInfo);
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
                          searchTextField(),
                          const SizedBox(height: 20,),
                          createGrouppedList()
                        ],)
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget createHeader() {
    List<String> list = [
      "Eng yangi",
      "Eng eski",
      "Ism (A -Ng)",
      "Ism (Ng - A)"
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/icon_1.png", width: 30, height: 30,),
          Row(
            children: [
              Text("Saralash: ",
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(128, 128, 128, 1)),),
              const SizedBox(width: 20,),
              createShadowDropBox(list: list, w: 135, h: 35, corner: 11)
            ],
          )
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color.fromRGBO(140, 196, 217, 1))
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                "images/search_blue.png", width: 20, height: 20,),
            ),
            const SizedBox(width: 10,),
            const Expanded(
                child: CleanButtonTextField(placeHolder: "Type here",)
            )
          ],)
    );
  }

  Widget createGrouppedList() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView.builder(
            itemCount: groupedSearchMap.length,
            itemBuilder: (context, index) {
              String groupID = groupedSearchMap.keys.elementAt(index);
              List<SearchInfo>? infoList = groupedSearchMap[groupID];
              return Column(
                children: [
                  Container(
                    color: const Color.fromRGBO(17, 138, 178, 1),
                    child: Text(
                      groupID, style: const TextStyle(color: Colors.white),),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.builder(
                          itemCount: infoList?.length,
                          itemBuilder: (context, index) {
                            SearchInfo item = infoList![index];
                            return grouppedItem(info: item);
                          }
                      ))
                ],);
            }
        )
    );
  }

  Widget grouppedItem({required SearchInfo info}){
      return Container();
  }
}