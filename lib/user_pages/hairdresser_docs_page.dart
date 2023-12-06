
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/content_views/tap_animation_widget.dart';

class HairdresserDocsPage extends StatefulWidget{
  const HairdresserDocsPage({super.key});

  @override
  State<HairdresserDocsPage> createState() => _HairdresserDocsPage();
}

final docList = <String>[
  "images/avatar_1.png",
  "images/avatar_2.png",
  "images/avatar_3.png",
  "images/avatar_4.png",
  "images/avatar_5.png",
  "images/icon_2.png",
  "images/call_1.png",
  "images/avatar_2.png",
  "images/avatar_3.png",
  "images/avatar_4.png",
  "images/avatar_5.png",
  "images/avatar_2.png",
  "images/avatar_3.png",
  "images/avatar_4.png",
  "images/avatar_5.png",
  "images/avatar_2.png",
  "images/avatar_3.png",
  "images/avatar_4.png",
  "images/avatar_5.png",
];

class _HairdresserDocsPage extends State<HairdresserDocsPage>{

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                createNavigationbar(),
                Expanded(
                    child: Container(
                      color: const Color.fromRGBO(240, 244, 249, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: GridView.count(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                children: List.generate(
                                    docList.length, (index) {
                                  return createRowContainer(
                                      image: docList[index]);
                                }),
                              ),
                            )
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget createNavigationbar() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            TapAnimationWidget(
              tabWidget: Image.asset(
                "images/icon_1.png", width: 30, height: 30,),
              onPressedCallBack: () {
                //Navigator.pop(context);
              },
            ),
            const SizedBox(width: 15,),
            CircleAvatar(
                radius: 19,
                backgroundColor: Colors.grey,
                child: ClipOval(
                    child: Image.asset(
                      "images/avatar_1.png", width: 35, height: 35,)
                )
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alisher Karimov", style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 17),),
                Row(
                  children: [
                    Text("ID 1234567",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 14),
                    ),
                    //Expanded(child: SizedBox(height: 10,),)
                  ],
                )
              ],
            ),
          ],
        )
    );
  }

  Widget createRowContainer({required String image}) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 155, 203, 1),
          border: Border.all(color: Colors.grey, width: 1.5)
      ),
      child: Image.asset(image),
    );
  }
}