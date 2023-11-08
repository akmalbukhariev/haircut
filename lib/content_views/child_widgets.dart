
import 'package:flutter/material.dart';

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