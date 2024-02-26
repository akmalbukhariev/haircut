import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/constant/control_app.dart';

import '../../../data/models/my_service.dart';
import '../../widgets/child_widgets.dart';
import '../../widgets/tap_animation_widget.dart';
import '../loading_overlay.dart';
import 'hairdresser_list/hairdresser_list_cubit.dart';
import 'hairdresser_list/hairdresser_list_state.dart';
import 'make_appointment_page.dart';

final imageList = [
  "images/avatar_5.png",
  "images/avatar_5.png",
  "images/avatar_5.png",
  "images/avatar_5.png"
];
CarouselController buttonCarouselController = CarouselController();

class HairdresserPage extends StatefulWidget{
  const HairdresserPage({super.key});

  @override
  State<HairdresserPage> createState()  => _HairdresserPage();
}

class _HairdresserPage extends State<HairdresserPage> {

  @override
  void initState() {
    context.read<HairdresserListCubit>().getDetailData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<HairdresserListCubit, HairdresserListState>(
            builder: (context, state) {
              return Material(
                  child: SafeArea(
                      child: Stack(
                        children: [
                          Container(
                              color: const Color.fromRGBO(240, 244, 249, 1),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      createSwiperImages(state: state),
                                      createHeader(state: state)
                                    ],
                                  ),
                                  createAboutInfo(state: state),
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 15,),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      left: 20,
                                                      right: 20,
                                                      bottom: 20),
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
                                                            createServices(
                                                                state: state),
                                                            additionalDoc(),
                                                            createScoreView(state: state),
                                                            createGeoLocation(),
                                                            createCallButton(
                                                                state: state)
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,),
                                                      SizedBox(
                                                          width: double
                                                              .infinity,
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
                                                                CupertinoPageRoute(
                                                                    builder: (
                                                                        context) =>
                                                                        MakeAppointmentPage()),
                                                              );
                                                            },
                                                            child: const Text(
                                                                "Qabulga yozilish"),
                                                          )
                                                      )
                                                    ],
                                                  )
                                              ),
                                            ],
                                          )
                                      )
                                  )
                                ],
                              )
                          ),
                          if(state.isLoading)
                            LoadingOverlayWidget()
                        ],
                      )
                  )
              );
            }
        )
    );
  }

  Widget createHeader({required HairdresserListState state}) {
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

  Widget createSwiperImages({required HairdresserListState state}) {
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

  Widget createAboutInfo({required HairdresserListState state}) {
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
                        child: createText(
                            text: "${state.detailInfo?.name}",
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: 5,),
                    Align(alignment: Alignment.centerLeft,
                        child: createText(text: "${state.detailInfo?.profession}")),
                    const SizedBox(height: 5,),
                    Align(alignment: Alignment.centerLeft,
                        child: createText(text: "${state.detailInfo?.phone}"))
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
                        child: createText(text: "Ish vaqti ${state.detailInfo?.workingHour}",
                            textOverflow: TextOverflow.visible))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget createText({
    required String text,
    FontWeight fontWeight = FontWeight.normal,
    Color color = const Color.fromRGBO(
      102, 102, 102, 1),
    textOverflow = TextOverflow.ellipsis})
  {
    return Text(text,
      overflow: textOverflow,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 17),
    );
  }

  Widget createServices({required HairdresserListState state}) {
    /*List<MyService> serviceList = [];
    List<String>? strServiceList = state.detailInfo?.services?.split(',');
    List<String>? strPricesList = state.detailInfo?.prices?.split(',');
    List<String>? strColorList = state.detailInfo?.serviceColor?.split(',');

    if (strServiceList != null && strPricesList != null && strColorList != null) {
      for (var i = 0; i < strServiceList.length; i++) {
        String? strColor = ControlApp.Instance()?.formatColorForFlutter(strColorList[i]);
        if (strColor != null) {
          Color color = Color(int.parse(strColor));
          serviceList.add(MyService(
            color: color,
            text: strServiceList[i],
            price: strPricesList[i],
          ));
        }
      }
    }*/
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
              height: 150,
              child: ListView.builder(
                //physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.serviceList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemService(service: state.serviceList![index]);
                },
              ),
            )
          ],
        )
    );
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
                createText(text: service.text ?? "")
              ],
            ),
            createText(text: service?.price ?? "")
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

  Widget createScoreView({required HairdresserListState state}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
        color: const Color.fromRGBO(248, 248, 248, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createScore(
                    score: double.parse(state.detailInfo?.averageScores ?? '0.0')
                        .round()),
                const SizedBox(width: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
                  children: [
                    createProgressBar(
                        context: context,
                        starCount: 5,
                        value: state.score5 ?? 0.0,
                        percentage: state.score5!.toInt().toString() ?? ""
                    ),
                    const SizedBox(height: 5,),
                    createProgressBar(
                        context: context,
                        starCount: 4,
                        value: state.score4 ?? 0.0,
                        percentage: state.score4!.toInt().toString() ?? ""
                    ),
                    const SizedBox(height: 5,),
                    createProgressBar(
                        context: context,
                        starCount: 3,
                        value: state.score3 ?? 0.0,
                        percentage: state.score3!.toInt().toString() ?? ""
                    ),
                    const SizedBox(height: 5,),
                    createProgressBar(
                        context: context,
                        starCount: 2,
                        value: state.score2 ?? 0.0,
                        percentage: state.score2!.toInt().toString() ?? ""
                    ),
                    const SizedBox(height: 5,),
                    createProgressBar(
                        context: context,
                        starCount: 1,
                        value: state.score1 ?? 0.0,
                        percentage: state.score1!.toInt().toString() ?? ""
                    ),
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
          ],
        )
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

  Widget createCallButton({required HairdresserListState state}) {
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
                        child: Text(state.detailInfo?.phone ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
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