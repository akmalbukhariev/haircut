
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'clean_button_textfield.dart';

Widget saveButton({Color col = Colors.red, VoidCallback? onPressedCallBack,}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressedCallBack,
      style: ElevatedButton.styleFrom(
          backgroundColor: col,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
      child: const Text("Saqlash"),
    ),
  );
}

Widget navigationBar({required BuildContext context,String title = ""}) {
  return Stack(
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                      Navigator.pop(context);
                },
                child: Image.asset(
                  "images/icon_1.png", width: 30, height: 30,)
                ,)
          )
      ),
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Align(
              alignment: Alignment.center,
              child: Text(title,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(20, 137, 178, 1)),
              )
          ))
    ],
  );
}

Widget animateWidget({required Widget widget,required BuildContext context, bool visible = false}) {
  return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      bottom: visible ? 0 : -MediaQuery
          .of(context)
          .size
          .height,
      left: 0,
      right: 0,
      child: widget
  );
}

Widget searchTextField({required TextEditingController controlTextField}) {
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
          Expanded(
              child: CleanButtonTextField(
                controlTextField: controlTextField,
                placeHolder: "Type here",
              )
          )
        ],)
  );
}

Widget additionalDocNote(){
  return noteText(text: "Qo'shimcha hujjatlarga, "
      "faxriy yorliq, sovrin va shu kabi boshga "
      "turdagi ma'lumotlarni anglatadi."
      "Qo'shimcha ma'lumotlarni kiritish natijasida, "
      "mijozlarni e'tiborini jalb qilishingiz mumkin."
      "Iltimos, qalbaki hujjatlarni joylamang. Qalbaki "
      "hujjatlarni joylagan shaxs, O'zbekiston Respublikasi "
      "gonunchiligiga asosan javobgarlikka tortilishi mumkin."
      "Qo'shimcha hujjatlar rasm formatida bo'lishi kerak "
      "va uni go'shishning maksimal miqdori 9 dona.");
}

Widget licenseNote(){
  return noteText(text: "Bu sizing faoliyatingizni belgilab "
      "beruvchi Ruxsatnoma yoki Guvohnoma yoki Sertifikat "
      "shaklidagi hujjat bolishi mumkin Iltimos, galbaki "
      "hujjatlarni joylamang. Qalbaki hujjatlarni joylagan "
      "shaxs, O'zbekiston Respublikasi qonunchiligiga asosan "
      "javobgarlikka tortilishi mumkin. Ruxsatnomalar rasm "
      "formatida bo'lishi kerak va "
      "(uni go'shishning maksimal miqdori 6 dona.");
}

Widget addressNote(){
  return noteText(text: "Iltimos, manzilingizni to'g'ri "
      "yozilganiga e'tibor bering. "
      "Siz tomondan kiritilgan manzil "
      "mijoz uchun qulaylik vazifasini bajaradi.");
}

Widget geolocationNote(){
  return noteText(text: "Iltimos, geojoylashuvni to'g'ri "
      "belgilashda e'tiborli bo'ling. "
      "Sizning belgilagan geojoylashuvingiz, "
      "mijozingiz sizni aniq joydan topishga yordam beradi.");
}

Widget photoNote(){
  return noteText(text: "Fotosuratlar sizning ish joyingiz, "
      "ish jarayoningiz, foydalangan asbob-uskuna va"
      "mahsulotlaringiz bo'lishi mumkin."
      "Iltimos, fotosuratlarning sifatiga, "
      "ranglari va yorug'likning yetarli ekaniga ishonch"
      "hosil qiling. O'zbekiston Respublikasi qonunchiligida "
      "ommaga ko'rsatilishi taqiqlangan yoki o'ziga"
      "tegishli bo'lmagan suratlarni joylashtirish "
      "qat'iyan man qilinadi Surat qo'shishning maksimal miqdori 9 dona.");
}

Widget phoneNote(){
  return noteText(text: "Eslatma: Telefon raqamingizni "
      "o'zgartirish vaqtida uning to'g'ri "
      "yozilganiga ishonch hozil qiling. "
      "Sizga tegishli bo'lmagan telefon "
      "raqamidan foydalanishga urunishingiz "
      "O'zbekiston Respublikasi qonunchiligiga "
      "asosan javobgarlikka tortilishingizga "
      "sabab bo'lishi mumkin.");
}

Widget noteText({required String text}) {
  return Text(text,
    textAlign: TextAlign.start,
    style: const TextStyle(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(102, 102, 102, 1),
        fontSize: 15
    ),
    softWrap: true,);
}

Widget createShadowDropBox({required List<String> list, required double w, required double h, double corner = 15}) {
  String? selectedItem = list.first;
  final TextEditingController colorController = TextEditingController();

  return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(corner),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: DropdownButton<String>(
          value: selectedItem,
          //icon: const Icon(Icons.arrow_forward_ios, size: 12),
          elevation: 0,
          style: const TextStyle(color: Colors.grey),
          underline: const SizedBox(),
          onChanged: (String? newValue) {},
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      )
  );
}

Widget createProgressBar({
  required BuildContext context,
  required int starCount,
  double value = 0,
  String percentage = "0"
}) {
  return Row(
    children: [
      Text(starCount.toString(),
        style: const TextStyle(color: Colors.black),),
      LinearPercentIndicator(
        animation: true,
        lineHeight: 10.0,
        width: 140,
        /*width: MediaQuery
            .of(context)
            .size
            .width - 250,*/
        animationDuration: 2500,
        percent: (value/ 100).clamp(0.0, 1.0),
        barRadius: const Radius.circular(10),
        progressColor: const Color.fromRGBO(252, 59, 45, 1),
      ),
      Text('$percentage %',
        style: const TextStyle(color: Colors.black),
      ),
    ],
  );
}

Widget createScore({int score = 0}) {
  return Column(
    children: [
      Text(score.toString(),
        style: const TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.normal
        ),
      ),
      rowStar(score: score.toInt())
    ],
  );
}

Widget rowStar({int score = 0}) {
  dynamic row;
  switch (score) {
    case 0:
      row = Row(
        children: [
          starOffImage(),
          starOffImage(),
          starOffImage(),
          starOffImage(),
          starOffImage(),
        ],
      );
      break;
    case 1:
      row = Row(
        children: [
          starOnImage(),
          starOffImage(),
          starOffImage(),
          starOffImage(),
          starOffImage(),
        ],
      );
      break;
    case 2:
      row = Row(
        children: [
          starOnImage(),
          starOnImage(),
          starOffImage(),
          starOffImage(),
          starOffImage(),
        ],
      );
      break;
    case 3:
      row = Row(
        children: [
          starOnImage(),
          starOnImage(),
          starOnImage(),
          starOffImage(),
          starOffImage(),
        ],
      );
      break;
    case 4:
      row = Row(
        children: [
          starOnImage(),
          starOnImage(),
          starOnImage(),
          starOnImage(),
          starOffImage(),
        ],
      );
      break;
    case 5:
      row = Row(
        children: [
          starOnImage(),
          starOnImage(),
          starOnImage(),
          starOnImage(),
          starOnImage(),
        ],
      );
      break;
  }
  return row;
}

Widget starOnImage() {
  return Image.asset("images/icon_16.png", width: 20, height: 20,);
}

Widget starOffImage() {
  return Image.asset("images/icon_15.png", width: 20, height: 20,);
}

Widget createComment({String name = "", int starCount = 0, String strDate = "", String comment = "", bool showDivider = true}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Row(
          children: [
            rowStar(score: starCount),
            const SizedBox(width: 15,),
            Text(strDate, style: const TextStyle(fontSize: 13),)
          ],
        ),
        const SizedBox(height: 10,),
        Text(comment, style: const TextStyle(color: Colors.grey),),
        showDivider? const Divider(color: Colors.grey,) : Container()
      ],)
    ,);
}