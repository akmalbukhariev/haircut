
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/my_service.dart';
import '../../widgets/child_widgets.dart';
import '../../widgets/tap_animation_widget.dart';
import 'make_appointment_page.dart';

final imageList = [
  "images/avatar_5.png",
  "images/avatar_5.png",
  "images/avatar_5.png",
  "images/avatar_5.png"
];
CarouselController buttonCarouselController = CarouselController();

final serviceList = [
  MyService(color: Colors.deepPurple, text: "Ukladka", price: "50,000 so'm"),
  MyService(color: Colors.red, text: "Soch bo'yash", price: "10,000 so'm"),
  MyService(color: Colors.blue, text: "Soqol olish", price: "120,000 so'm"),
  MyService(color: Colors.yellow, text: "Soch olish", price: "80,000 so'm"),
  MyService(color: Colors.blueGrey, text: "Soch olish", price: "8,000 so'm"),
  MyService(color: Colors.grey, text: "Soch olish", price: "5,000 so'm"),
];

class HairdresserPage extends StatefulWidget{
  const HairdresserPage({super.key});

  @override
  State<HairdresserPage> createState()  => _HairdresserPage();
}

class _HairdresserPage extends State<HairdresserPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: SafeArea(
                child: Container(
                    color: const Color.fromRGBO(240, 244, 249, 1),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            createSwiperImages(),
                            createHeader()
                          ],
                        ),
                        createAboutInfo(),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 15,),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                  createServices(),
                                                  additionalDoc(),
                                                  createScoreView(),
                                                  createGeoLocation(),
                                                  createCallButton()
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                      backgroundColor: Colors
                                                          .red,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(
                                                            10),
                                                      )
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(builder: (context) => MakeAppointmentPage()),
                                                    );
                                                  },
                                                  child: const Text(
                                                      "Qabulga yozilish"),
                                                )
                                            )
                                          ],)
                                    ),
                                  ],
                                )
                            )
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
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("images/back.png", width: 30, height: 30,),
          ),
          Row(
            children: [
              Image.asset("images/heart_2.png", width: 30, height: 30,),
              const SizedBox(width: 10,),
              Image.asset("images/share_1.png", width: 30, height: 30,),
            ],
          )
        ],
      ),
    );
  }

  int inIndex = 1;

  Widget createSwiperImages() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                inIndex = index + 1;
              });
            },
          ),
          //items: imageList.map((item) => Image.asset(item, width: double.maxFinite,)).toList(),
          items: imageList.map((item) =>
              Center(
                  child: Image.asset(item, fit: BoxFit.cover, height: MediaQuery
                      .of(context)
                      .size
                      .height)),
          ).toList(),
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: indicatorText(text: "$inIndex/${imageList.length}")
                )
            )
        )
      ],
    );
  }

  Widget indicatorText({String text = ""}) {
    return Container(
        width: 45,
        height: 18,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        )
    );
  }

  Widget createAboutInfo() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10, top: 10, right: 15, bottom: 10),
        child: Row(
          children: [
            SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: createText(text: "Alisher Ortiqov",
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: 5,),
                    Align(alignment: Alignment.centerLeft,
                        child: createText(text: "Sartarosh, Stilis")),
                    const SizedBox(height: 5,),
                    Align(alignment: Alignment.centerLeft,
                        child: createText(text: "+998975632164"))
                  ],
                )
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
                width: 170,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: TapAnimationWidget(
                          tabWidget: Image.asset(
                            "images/speech_bubble_1.png", width: 30,
                            height: 30,),
                          onPressedCallBack: () {

                          },
                        )),
                    const SizedBox(height: 15,),
                    Align(alignment: Alignment.centerRight,
                        child: createText(text: "Ish vaqti 9:00 ~ 18:00",
                            textOverflow: TextOverflow.visible))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget createText({required String text, FontWeight fontWeight = FontWeight
      .normal, Color color = const Color.fromRGBO(
      102, 102, 102, 1), textOverflow = TextOverflow.ellipsis}) {
    return Text(text,
      overflow: textOverflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 17),
    );
  }

  Widget createServices() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Xizmat turlari",
              style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                //physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: serviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemService(service: serviceList[index]);
                },
              ),
            )
          ],
        )
    );

    /*Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Xizmat turlari",
                style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),),
            ),
            const SizedBox(height: 10,),
            /*CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((
                          BuildContext context, int index) {
                        return Container(color: Colors.yellow,);//itemService(service: serviceList[index]);
                      },
                        childCount: serviceList.length,
                      )
                  )
                ]
            ),*/
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: serviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemService(service: serviceList[index]);
                }
            )
          ],
        )
    );*/
  }

  Widget itemService({required MyService service}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: service.color,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                const SizedBox(width: 10,),
                createText(text: service.text)
              ],
            ),
            createText(text: service.price)
          ],
        ),
        const SizedBox(height: 5,),
        Container(height: 1, color: const Color.fromRGBO(240, 240, 240, 1),),
        const SizedBox(height: 10,)
      ],
    );
  }

  Widget additionalDoc() {
    return Container(
      color: const Color.fromRGBO(232, 255, 253, 1),
      height: 60,
      child: Center(
        child: TapAnimationWidget(
            tabWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ruxsatnoma va Qo'shimcha hujjarlar",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(24, 141, 180, 1),
                      fontSize: 17),
                ),
                const SizedBox(width: 10,),
                Image.asset("images/right.png", width: 15, height: 15,)
              ],
            )
        ),
      ),
    );
  }

  Widget createScoreView() {
    return Container(
        color: const Color.fromRGBO(248, 248, 248, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createScore(score: 3),
                const SizedBox(width: 45,),
                Column(
                  children: [
                    createProgressBar(
                        context: context, value: 5),
                    createProgressBar(
                        context: context, value: 4),
                    createProgressBar(
                        context: context, value: 3),
                    createProgressBar(
                        context: context, value: 2),
                    createProgressBar(
                        context: context, value: 1),
                  ],
                )
              ],
            ),
            const Divider(color: Colors.grey),//Color.fromRGBO(230, 230, 230, 1),),
            createComment(
                name: "Begzod Nazarov",
                starCount: 3,
                strDate: "05.10.2023",
                comment: "Sartaroshga gap yo'q. Hush muomilla, sifat yaxshi",
                showDivider: false
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: TapAnimationWidget(
                    tabWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Barchasini ko'rish",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(24, 141, 180, 1),
                              fontSize: 17),
                        ),
                        const SizedBox(width: 10,),
                        Image.asset("images/right.png", width: 15, height: 15,)
                      ],
                    )
                )
            ),
            Container(height: 1, color: Color.fromRGBO(230, 230, 230, 1))
            //const Divider(color: Colors.grey),//Color.fromRGBO(230, 230, 230, 1),),
          ],)
    );
  }

  Widget createGeoLocation() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft, child: Text("Geojoylashuv",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(102, 102, 102, 1)
              ),
            ),
            )
        ),
        SizedBox(
          height: 250,
        ),
        const Divider(color: Colors.grey)//Color.fromRGBO(230, 230, 230, 1),),
      ],
    );
  }

  Widget createCallButton() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: TapAnimationWidget(
            tabWidget: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromRGBO(12, 174, 0, 1)
                  )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(245, 255, 245, 1),
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(8), right: Radius.circular(0))
                      ),
                        child: Center(
                        child: Text("+998 90 000 00 00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                    ),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(12, 174, 0, 1),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(0), right: Radius.circular(8))
                      //vertical(top: Radius.circular(10),bottom: Radius.circular(0)),
                    ),
                    child: Row(
                      children: [
                        Image.asset("images/call.png", width: 30, height: 30,),
                        Text("Qo'g'iroq qilish", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}