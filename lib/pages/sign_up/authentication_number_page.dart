
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/content_views/tap_animation_widget.dart';

import '../../content_views/clean_button_textfield.dart';

class AuthenticationNumberPage extends StatefulWidget{
  const AuthenticationNumberPage({super.key});

  @override
  State<AuthenticationNumberPage> createState() => _AuthenticationNumberPage();
}

class _AuthenticationNumberPage extends State<AuthenticationNumberPage>{
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("MAXSUS KOD",
                        style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontSize: 20),),
                      SizedBox(height: 25,),
                      SizedBox(
                          width: 250,
                          child: Text(
                            "Biz +998 99 88 77 66 telefon raqamiga maxsus kod yubordik",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                          )
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Text("Kutish vaqti", style: TextStyle(
                            color: Color.fromRGBO(17, 138, 178, 1),)),
                          Text("01:36", style: TextStyle(color: Colors.red),),
                          SizedBox(height: 10,),
                          TapAnimationWidget(
                            tabWidget: Text("Kodni qaytadan yuborish",
                              style: TextStyle(
                                  color: Color.fromRGBO(234, 234, 234, 1)),
                            ),
                            onPressedCallBack: () {

                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 1)
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: CleanButtonTextField(
                                    placeHolder: "Maxsus kodni kiriting",)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .circular(
                                    10),
                              )
                          ),
                          onPressed: () {},
                          child: const Text("Davom etish"),
                        )
                    )
                ),)
            ],
          ),
        )
    );
  }
}