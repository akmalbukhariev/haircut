import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/hairdresser/my_page/my_name_page.dart';
import 'package:haircut/presentation/pages/hairdresser/my_page/my_surname_page.dart';

import '../../../../data/models/basic_tile.dart';
import '../../../widgets/child_widgets.dart';
import '../../../widgets/date_picker_widget.dart';
import '../../loading_overlay.dart';
import '../main_page/main_page_cubit.dart';
import '../main_page/main_page_state.dart';
import 'additional_doc_page.dart';
import 'my_license_page.dart';
import 'my_address.dart';
import 'my_comments_page.dart';
import 'my_geolocation_page.dart';
import 'my_phone_page.dart';
import 'my_photo_album.dart';
import 'my_services_page.dart';

class HairdresserMyPage extends StatefulWidget {
  const HairdresserMyPage({super.key});

  @override
  State<HairdresserMyPage> createState() => _HairdresserMyPage();
}

class _HairdresserMyPage extends State<HairdresserMyPage> {
  bool _dateTimeVisible = false;
  bool _professionVisible = false;
  String workingHour = "";
  String workingHourFrom = "";
  String workingHourTill = "";

  @override
  void initState() {
    context.read<MainPageCubit>().getDetailData();
    /*workingHour = context.read<MainPageCubit>().
    state.
    hairdresserDetailInfo?.
    workingHour ?? "";*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: BlocBuilder<MainPageCubit, MainPageState>(
              builder: (context, state) {
                return SafeArea(
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                                color: const Color.fromRGBO(240, 244, 249, 1),
                                child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 20),
                                            child: Stack(
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: (){
                                                          Navigator.pop(context);
                                                        },
                                                        child: Image.asset(
                                                          "images/icon_1.png",
                                                          width: 30,
                                                          height: 30,)
                                                    ),
                                                    const Expanded(
                                                        child: SizedBox()),
                                                    Image.asset(
                                                      "images/share.png", width: 30,
                                                      height: 30,),
                                                  ],
                                                ),
                                                Container(
                                                    padding: const EdgeInsets.only(
                                                        top: 15),
                                                    child: Center(
                                                      child: Image.asset(
                                                        "images/avatar.png",
                                                        width: 170,
                                                        height: 170,)
                                                      ,)
                                                ),
                                              ],
                                            )
                                        ),
                                        const SizedBox(height: 10,),
                                        Center(
                                          child: Column(
                                            children: [
                                               Text("${state.hairdresserDetailInfo?.surname} "
                                                    "${state.hairdresserDetailInfo?.name}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      decoration: TextDecoration.none)
                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  starImage(
                                                      im: "images/icon_13.png"),
                                                  starImage(
                                                      im: "images/icon_13.png"),
                                                  starImage(
                                                      im: "images/icon_13.png"),
                                                  starImage(
                                                      im: "images/icon_14.png"),
                                                  starImage(
                                                      im: "images/icon_14.png")
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              Text("ID raqam: ${state.hairdresserDetailInfo?.phone}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                      decoration: TextDecoration.none
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                  10),
                                            ),
                                            child: buildList(state),
                                          ),
                                        ),
                                      ],
                                    )
                                )
                            )
                        ),
                        animateWidget(
                            widget: createDateTime(),
                            context: context,
                            visible: _dateTimeVisible
                        ),
                        animateWidget(
                            widget: createProfession(),
                            context: context,
                            visible: _professionVisible
                        ),
                        if(state.isLoading)
                          const LoadingOverlayWidget()
                      ],
                    )
                );
              }
            )
        )
    );
  }

  Widget starImage({String im = ""}) {
    return Image.asset(im, width: 20, height: 20,);
  }

  Widget buildList(MainPageState state) {
    return Column(
      children: [
        ExpansionTile(
          collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          title: Row(
            children: [
              Image.asset("images/userinfo.png", width: 20, height: 20,),
              const SizedBox(width: 10,),
              Text("Mening ma'lumotlarim",
                style: TextStyle(color: Colors.black),
              ),
              const Expanded(child: SizedBox()),
              //Text(tile.text, style: TextStyle(color: tile.textColor),),
            ],
          ),
          children: <Widget>[
            createTile(
              text1: "Ismim",
              text2: state.hairdresserDetailInfo?.name ?? "",
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyNamePage()),
                );
              }
            ),
            createTile(
              text1: "Familiyam",
              text2: state.hairdresserDetailInfo?.surname ?? "",
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MySurnamePage()),
                );
              }
            ),
            createTile(
              text1: "Kasbim",
              text2: state.hairdresserDetailInfo?.profession ?? "",
              onPressedCallBack: (){
                setState(() {
                  _professionVisible = !_professionVisible;
                });
              }
            ),
            createTile(
                text1: state.hairdresserDetailInfo?.phone ?? "",
                colorText1: const Color.fromRGBO(73, 162, 191, 1),
                onPressedCallBack: (){
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const PhonePage()),
                  );
                }
            ),
            createTile(
              text1: state.hairdresserDetailInfo?.address ?? "",
              colorText1: const Color.fromRGBO(73, 162, 191, 1),
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const AddressPage()),
                );
              }
            ),
            createTile(
                text1: "Gejoylashuv",
                onPressedCallBack: (){
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const MyGeoLocationPage()),
                  );
                }
            ),
            createTile(
              text1: "Ish vaqti",
              text2: context.read<MainPageCubit>().state.hairdresserDetailInfo?.workingHour ?? "",
              //workingHour,
              onPressedCallBack: (){
                setState(() {
                  _dateTimeVisible = !_dateTimeVisible;
                });
              }
            ),
            createTile(
              text1: "Fotosuratlar",
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyPhotoAlbumPage()),
                );
              }
            ),
            createTile(
              text1: "Ruxsatnomalar",
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyLicensePage()),
                );
              }
            ),
            createTile(
              text1: "Qo'shimcha hudjatlar",
              showDivider: false,
              onPressedCallBack: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyAdditioanlDocPage()),
                );
              }
            ),
          ],
        ),
        ListTile(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const MyServicesPage()),
              );
            });
          },
          title: Row(
            children: [
              Image.asset("images/services.png", width: 20, height: 20,),
              const SizedBox(width: 10,),
              Text("Mening xizmatlarim",
                style: TextStyle(color: Colors.black,)),
              const Expanded(child: SizedBox()),
              Text(
                (state.hairdresserDetailInfo?.services?.length ?? 0).toString(),
                style: TextStyle(
                    color: const Color.fromRGBO(73, 162, 191, 1)
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Divider(
              color: Colors.grey.shade200, thickness: 1,)
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const MyCommentsPage()),
            );
          },
          title: Row(
            children: [
              Image.asset("images/comments.png", width: 20, height: 20,),
              const SizedBox(width: 10,),
              Text("Men haqimda sharhlar",
                  style: TextStyle(color: Colors.black,)),
              const Expanded(child: SizedBox()),
              Text("",
                style: TextStyle(
                    color: const Color.fromRGBO(73, 162, 191, 1)
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Divider(
              color: Colors.grey.shade200, thickness: 1,)
        ),
        ListTile(
          onTap: () {
            context.read<MainPageCubit>().exitApp(context);
          },
          title: Row(
            children: [
              Image.asset("images/logout.png", width: 20, height: 20,),
              const SizedBox(width: 10,),
              Text("Chiqish",
                  style: TextStyle(color: Colors.red,)),
              const Expanded(child: SizedBox()),
            ],
          ),
        )
      ],
    );
  }

  Widget createTile({
    String text1 = "",
    String text2 = "",
    Color colorText1 = Colors.black,
    Color colorText2 = const Color.fromRGBO(73, 162, 191, 1),
    bool showDivider = true,
    VoidCallback? onPressedCallBack
  }) {
    return Container(
        color: const Color.fromRGBO(249, 249, 249, 1),
        child: Column(
          children: [
            ListTile(
              onTap: (){
                onPressedCallBack!();
              },
              title: Row(
                children: [
                  Text(text1, style: TextStyle(color: colorText1,)),
                  const Expanded(child: SizedBox()),
                  Text(text2, style: TextStyle(color: colorText2,)),
                ],
              ),
            ),
            if(showDivider)
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Divider(
                    color: Colors.grey.shade200, thickness: 1,)
              )
          ],
        )
    );
  }

  Widget createDateTime() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child:GestureDetector(
              onTap: (){
                setState(() {
                  _dateTimeVisible = !_dateTimeVisible;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _dateTimeVisible = !_dateTimeVisible;
                            });
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Ish vaqtingiz",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: DatePickerWidget(
                                    title: 'Dan',
                                    onDateTimeChanged: (newDate){
                                      setState(() {
                                        workingHourFrom = "${newDate.hour}:${newDate.minute}";
                                        workingHour = "${workingHourFrom} - ${workingHourTill}";
                                      }
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: DatePickerWidget(
                                    title: 'Gacha',
                                    onDateTimeChanged: (newDate){
                                      setState(() {
                                        workingHourTill = "${newDate.hour}:${newDate.minute}";
                                        workingHour = "${workingHourFrom} - ${workingHourTill}";
                                      }
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                            child: saveButton(
                              onPressedCallBack: () {
                                setState(() {
                                  _dateTimeVisible = !_dateTimeVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*Widget createDateTime() {
    return Container(
        color: Colors.black.withOpacity(0.5),
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _dateTimeVisible = !_dateTimeVisible;
                          });
                        },
                        child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              width: 100,
                              height: 5,
                            )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Ish vaqtingiz",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: DatePickerWidget(
                                    title: 'Dan',
                                  onDateTimeChanged: (newDate){
                                      setState(() {
                                        workingHourFrom = "${newDate.hour}:${newDate.minute}";
                                        workingHour = "${workingHourFrom} - ${workingHourTill}";
                                      });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: DatePickerWidget(
                                    title: 'Gacha',
                                  onDateTimeChanged: (newDate){
                                      setState(() {
                                        workingHourTill = "${newDate.hour}:${newDate.minute}";
                                        workingHour = "${workingHourFrom} - ${workingHourTill}";
                                      });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child:
                          Center(
                              child: saveButton(
                                  onPressedCallBack: () {
                                    setState(() {
                                      _dateTimeVisible = !_dateTimeVisible;
                                    });
                                  }
                              )
                          )
                      )
                    ],
                  ),
                )
            ),
            const SizedBox(height: 20,)
          ],
        )
    );
  }*/

  Widget createProfession() {
    return Container(
        color: Colors.black.withOpacity(0.5),
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _professionVisible = !_professionVisible;
                          });
                        },
                        child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              width: 100,
                              height: 5,
                            )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Mening kasbim",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          professioniItem(name: "Sartarosh"),
                          const Divider(color: Colors.grey, height: 1,),
                          professioniItem(name: "Stilis"),
                          const Divider(color: Colors.grey, height: 1,),
                          professioniItem(name: "Massajist"),
                          const Divider(color: Colors.grey, height: 1,),
                          professioniItem(name: "Kosmitolog"),
                          const Divider(color: Colors.grey, height: 1,),
                          professioniItem(name: "Depiliatsya"),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child:
                          Center(
                              child: saveButton(
                                  onPressedCallBack: () {
                                    setState(() {
                                      _professionVisible = !_professionVisible;
                                    });
                                  }
                              )
                          )
                      )
                    ],
                  ),
                )
            ),
            const SizedBox(height: 20,)
          ],
        )
    );
  }

  bool hairCutChecked = false;
  bool hairStilistChecked = false;
  bool hairMassajistChecked = false;
  bool hairKosmetologcked = false;
  bool hairDepilatsyaChecked = false;

  Widget professioniItem({required String name}) {
    bool isChecked = false;
    switch(name) {
      case "Sartarosh": isChecked = hairCutChecked; break;
      case "Stilis": isChecked = hairStilistChecked; break;
      case "Massajist": isChecked = hairMassajistChecked; break;
      case "Kosmitolog": isChecked = hairKosmetologcked;break;
      case "Depiliatsya": isChecked = hairDepilatsyaChecked; break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.5)
          ),
          side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 2.0, color: Color.fromRGBO(17, 138, 178, 1))
          ),
          checkColor: Colors.white,
          value: isChecked,
          activeColor: const Color.fromRGBO(17, 138, 178, 1),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;

              switch(name) {
                case "Sartarosh": hairCutChecked = isChecked; break;
                case "Stilis": hairStilistChecked = isChecked; break;
                case "Massajist": hairMassajistChecked = isChecked; break;
                case "Kosmitolog": hairKosmetologcked = isChecked;break;
                case "Depiliatsya": hairDepilatsyaChecked = isChecked; break;
              }
            });
          },
        ),
        Text(name,
          style: const TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontSize: 15
          ),
        )
      ],
    );
  }
}

