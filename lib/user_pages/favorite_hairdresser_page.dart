
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/hairdresser_info.dart';

final hairdressList = [
  HairdresserInfo(image: "images/avatar_1.png",name: "Alisher Ortikov", services: "Sartarosh, Stilis"),
  HairdresserInfo(image: "images/avatar_2.png",name: "Zarina Zokirova", services: "Kosmetologiya, Depilatsiya"),
  HairdresserInfo(image: "images/avatar_3.png",name: "Rustam Azizov", services: "Sartarosh, Stilis"),
];

class FavoriteHairdresserPage extends StatefulWidget{
  const FavoriteHairdresserPage({super.key});

  @override
  State<FavoriteHairdresserPage> createState() => _FavoriteHairdresserPage();
}

class _FavoriteHairdresserPage extends State<FavoriteHairdresserPage> {
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
                                        borderRadius: BorderRadius
                                            .circular(10)
                                    ),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets
                                            .all(6),
                                        itemCount: hairdressList
                                            .length,
                                        itemBuilder: (context,
                                            index) {
                                          return createItem(
                                              info: hairdressList[index]);
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
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 10),
      child: Text("Menga ma'qul bo'lganlar", style: const TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),)
      /*Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/icon_1.png", width: 25, height: 25,),
          ),
          const SizedBox(width: 10,),
          Text("Menga ma'qul bo'lganlar", style: const TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),
          )
        ],
      ),*/
    );
  }

  Widget createItem({required HairdresserInfo info}) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(info.image, width: 50, height: 50,),
          ),
          const SizedBox(width: 10,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(info.name, style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      Image.asset("images/heart.png", width: 20, height: 20,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(info.services, style: const TextStyle(
                      color: Color.fromRGBO(121, 121, 121, 1),
                      fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Divider( height: 2, color: Color.fromRGBO(244, 244, 244, 1),)
                ],
              )
          )
        ],
      ),
    );
  }
}