
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRoomPage extends StatefulWidget{
  const MyRoomPage({super.key});

  @override
  State<MyRoomPage> createState() => _MyRoomPage();
}

class _MyRoomPage extends State<MyRoomPage>{
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            createHeader(),
                            const SizedBox(height: 20,),
                            Expanded(
                                child: Stack(
                                  children: [
                                    Container(color: const Color.fromRGBO(
                                        240, 244, 249, 1),),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 30),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(10)
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  ExpansionTile(
                                                    title: Row(
                                                      children: [
                                                        Image.asset(
                                                          "images/userinfo.png",
                                                          width: 20,
                                                          height: 20,),
                                                        const SizedBox(
                                                          width: 5,),
                                                        Text(
                                                          "Mening ma'lumotlarim",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                  113, 113, 113,
                                                                  1)),),
                                                      ],
                                                    ),
                                                    children: [
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .only(left: 10),
                                                          child: Container(
                                                            color: Color
                                                                .fromRGBO(
                                                                249, 249, 249,
                                                                1),
                                                            child: Column(
                                                              children: [
                                                                createText(
                                                                    text1: "Mening ID raqamim",
                                                                    text2: "1234567",
                                                                    useBlue: false),
                                                                createText(
                                                                  text1: "Ismim",
                                                                  text2: "Akmal",),
                                                                createText(
                                                                    text1: "Familiyam",
                                                                    text2: "Buxariev"),
                                                                createText(
                                                                    text1: "Telefon raqamim",
                                                                    text2: "+998 90 999 99 99"),
                                                              ],
                                                            ),
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                  //const Divider(color: Colors.black12),//Color.fromRGBO(241, 241, 241, 1),),
                                                  ExpansionTile(
                                                    collapsedShape: const RoundedRectangleBorder(
                                                      side: BorderSide.none,
                                                    ),
                                                    title: Row(
                                                      children: [
                                                        Image.asset(
                                                          "images/services.png",
                                                          width: 20,
                                                          height: 20,),
                                                        const SizedBox(
                                                          width: 5,),
                                                        Text("Sozlamalar",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                  113, 113, 113,
                                                                  1)),),
                                                      ],
                                                    ),
                                                    children: [
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .only(left: 10),
                                                          child: Container(
                                                            color: Color
                                                                .fromRGBO(
                                                                249, 249, 249,
                                                                1),
                                                            child: Column(
                                                              children: [
                                                                createText(
                                                                  text1: "Til",
                                                                  text2: "O'zbekcha",),
                                                                createText(
                                                                    text1: "Xabardor qilish",
                                                                    text2: "5 daqiqa oldin"),
                                                              ],
                                                            ),
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                  //const Divider(color: Colors.black12, height: 5,),//Color.fromRGBO(241, 241, 241, 1),),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10,),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/email.png",
                                                            width: 20,
                                                            height: 20,),
                                                          const SizedBox(
                                                            width: 10,),
                                                          Text("Dastur bo'yicha murojat yuborish",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                      113, 113,
                                                                      113, 1))),
                                                        ],
                                                      )
                                                  ),
                                                  const Divider(color: Colors.black12, height: 5,),//Color.fromRGBO(241, 241, 241, 1),),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10,),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/logout.png",
                                                            width: 20,
                                                            height: 20,),
                                                          const SizedBox(
                                                            width: 10,),
                                                          Text("Chiqish",
                                                              style: TextStyle(color: Colors.red)),
                                                        ],
                                                      )
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                    )
                                  ],)
                            )
                          ],
                        )
                    ),
                  ),
                  /*animateWidget(
                      widget: createLanguage(),
                      context: context,
                      visible: _languageVisible),
                  animateWidget(
                      widget: createNotification(),
                      context: context,
                      visible: _notificationVisible),*/
                ])
        )
    );
  }

  Widget createHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/icon_1.png", width: 25, height: 25,),
          ),
          const SizedBox(width: 10,),
          Text("Shaxsiy kabinet", style: const TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1), fontSize: 20),)
        ],
      ),
    );
  }

  Widget createText({required String text1, required String text2, bool useBlue = true}){
    Color txtColor = useBlue? const Color.fromRGBO(73, 162, 191, 1) : const Color.fromRGBO(113, 113, 113, 1);
     return Padding(
         padding: const EdgeInsets.only(left: 10),
         child: Column(
           children: [
             Padding(padding: const EdgeInsets.only(top: 5, right: 5),
             child: ListTile(
               title: Text(text1, style: TextStyle(color: Color.fromRGBO(113, 113, 113, 1),),),
               trailing: Text(text2, style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),),
             )),
             const Divider(height: 1, color: Color.fromRGBO(113, 113, 113, 1),)
           ],
         ),
     );
  }
}