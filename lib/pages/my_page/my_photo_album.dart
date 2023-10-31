import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_views/clean_button_textfield.dart';
import 'content_views/save_button.dart';

Widget MyPhotoAlbumPage() {
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
                    child: Text("Fotosuratlar",
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
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                        child: photoGrid(),
                      ),
                      const Divider(height: 1, color: Colors.grey,),
                      Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          child: noteText()
                      ),
                      const Expanded(child: SizedBox()),
                      saveButton(w: 250, col: Colors.red),
                      const SizedBox(height: 20,)
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
  return const Text("Fotosuratlar sizning ish joyingiz, "
      "ish jarayoningiz, foydalangan asbob-uskuna va"
      "mahsulotlaringiz bo'lishi mumkin."
      "Iltimos, fotosuratlarning sifatiga, "
      "ranglari va yorug'likning yetarli ekaniga ishonch"
      "hosil qiling. O'zbekiston Respublikasi qonunchiligida "
      "ommaga ko'rsatilishi taqiqlangan yoki o'ziga"
      "tegishli bo'lmagan suratlarni joylashtirish "
      "qat'iyan man qilinadi Surat qo'shishning maksimal miqdori 9 dona",
    textAlign: TextAlign.start,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(102, 102, 102, 1),
        fontSize: 15
    ),
    softWrap: true,);
}

Widget photoGrid(){
  return Column(
    children: [
      rowGrid(),
      const SizedBox(height: 5,),
      rowGrid(),
      const SizedBox(height: 5,),
      rowGridLast()
    ],
  );
}

Widget rowGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createRowContainer(),
        const SizedBox(width: 5,),
        createRowContainer(),
        const SizedBox(width: 5,),
        createRowContainer(),
      ],
    );
}

Widget rowGridLast() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      createRowContainer(),
      const SizedBox(width: 5,),
      Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 241, 241, 1),
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(5)
        ),
        width: 100,
        height: 100,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("images/upload.png")
        ),
      ),
      const SizedBox(width: 5,),
      Container(
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        width: 100,
        height: 100,
      )
    ],
  );
}

Widget createRowContainer() {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 155, 203, 1),
        border: Border.all(color: Colors.grey, width: 1.5)
    ),
    width: 100,
    height: 100,
  );
}