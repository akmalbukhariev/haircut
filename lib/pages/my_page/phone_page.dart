
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PhonePage() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, top: 55),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("images/icon_1.png", width: 30, height: 30,)
                  ,)
            ),
            const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Telfon raqami",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          color: Color.fromRGBO(20, 137, 178, 1)),
                    )
                ))
          ],),
        SizedBox(height: 20,),
        Expanded(
            child: Container(
              color: const Color.fromRGBO(240, 244, 249, 1),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            )
        )
      ],
    ),
  );
}