
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_views/clean_button_textfield.dart';
import 'content_views/save_button.dart';

Widget AddressPage() {
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
                  child: Image.asset(
                    "images/icon_1.png", width: 30, height: 30,)
                  ,)
            ),
            const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Manzil",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          color: Color.fromRGBO(20, 137, 178, 1)),
                    )
                ))
          ],),
        const SizedBox(height: 20,),
        Expanded(
            child: Container(
              color: const Color.fromRGBO(240, 244, 249, 1),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: const CleanButtonTextField(placeHolder: "Enter your address here.",),
                      ),
                      const Divider(height: 1, color: Colors.grey,),
                      Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          child: noteText()
                      ),
                      Expanded(child: SizedBox()),
                      saveButton(w: 250, col: Colors.red),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    ),
  );
}

Widget noteText() {
  return const Text("Iltimos, manzilingizni to'g'ri "
      "yozilganiga e'tibor bering. "
      "Siz tomondan kiritilgan manzil "
      "mijoz uchun qulaylik vazifasini bajaradi.",
    textAlign: TextAlign.start,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(102, 102, 102, 1),
        fontSize: 15
    ),
    softWrap: true,);
}