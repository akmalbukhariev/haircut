
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/basic_tile.dart';
import '../../../widgets/child_widgets.dart';
import '../../../widgets/date_picker_widget.dart';
import 'additional_doc_page.dart';
import 'license_page.dart';
import 'my_address.dart';
import 'my_comments_page.dart';
import 'my_geolocation_page.dart';
import 'my_phone_page.dart';
import 'my_photo_album.dart';
import 'my_services_page.dart';

final basicTiles = [
  const BasicTile(
      image: "images/userinfo.png",
      title: "Mening ma'lumotlarim",
      myMenu: MyMenu.my_info,
      tiles: [
        BasicTile(title: "Kasbim", text: "Sartarosh, Stilist", myMenu: MyMenu.my_profession, textColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "+998 90 999 99 99", myMenu:MyMenu.my_phone , titleColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "Toshkent shaxar", myMenu: MyMenu.my_address, titleColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "Geojoylashuv", myMenu: MyMenu.my_location),
        BasicTile(title: "Ish vaqti",myMenu: MyMenu.my_work_time, text: "9:00 - 18:00", textColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "Fotosuratlar", myMenu: MyMenu.my_photos),
        BasicTile(title: "Ruxsatnomalar", myMenu: MyMenu.my_license),
        BasicTile(title: "Qo'shimcha xudjatlar", myMenu: MyMenu.my_addtinional_doc),
      ]),
  const BasicTile(
      image: "images/services.png",
      title: "Mening xizmatlarim",
      text: "4",
      myMenu: MyMenu.my_services,
      textColor: Color.fromRGBO(73, 162, 191, 1)
  ),
  const BasicTile(
      image: "images/comments.png",
      title: "Men haqimda sharhlar",
      text: "5",
      myMenu: MyMenu.my_comments,
      textColor: Color.fromRGBO(73, 162, 191, 1)
  ),
  const BasicTile(
      image: "images/logout.png",
      title: "Chiqish",
      myMenu: MyMenu.log_out,
      textColor: Colors.red
  )
];

class CustomerMyPage extends StatefulWidget {
  const CustomerMyPage({super.key});

  @override
  State<CustomerMyPage> createState() => _CustomerMyPage();
}

class _CustomerMyPage extends State<CustomerMyPage> {
  bool _dateTimeVisible = false;
  bool _professionVisible = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Material(
            child: SafeArea(
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
                                          const Text("Bukhariev Akmal",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .none)
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
                                          const Text("ID raqam: 1234567",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  decoration: TextDecoration
                                                      .none)
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
                                        child: createListView(),
                                      ),
                                    ),
                                  ],
                                )
                            )
                        )
                    ),
                    animateWidget(
                        widget: createDateTime(), context: context, visible: _dateTimeVisible),
                    animateWidget(
                        widget: createProfession(), context: context, visible: _professionVisible),
                  ],)
            )
        )
    );
  }

  Widget starImage({String im = ""}) {
    return Image.asset(im, width: 20, height: 20,);
  }

  Widget createListView() {
    return Column(
      children: [
        buildTile(basicTiles[0]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(basicTiles[1]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(basicTiles[2]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(basicTiles[3]),
      ],
    );
  }

  Widget buildTile(BasicTile tile) {
    if (tile.tiles.isEmpty) {
      if (tile.image == "") {
        return Container(
            color: const Color.fromRGBO(249, 249, 249, 1),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      switch (tile.myMenu) {
                        case MyMenu.my_profession:
                          _professionVisible = !_professionVisible;
                          break;
                        case MyMenu.my_phone:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const PhonePage()),
                          );
                          break;
                        case MyMenu.my_address:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const AddressPage()),
                          );
                          break;
                        case MyMenu.my_location:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const GeoLocationPage()),
                          );
                          break;
                        case MyMenu.my_work_time:
                          _dateTimeVisible = !_dateTimeVisible;
                          break;
                        case MyMenu.my_photos:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const MyPhotoAlbumPage()),
                          );
                          break;
                        case MyMenu.my_license:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const MyLicensePage()),
                          );
                          break;
                        case MyMenu.my_addtinional_doc:
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (
                                context) => const MyAdditioanlDocPage()),
                          );
                          break;
                        default:
                          break;
                      }
                    });
                  },
                  title: Row(
                    children: [
                      Text(tile.title, style: TextStyle(color: tile.titleColor),),
                      const Expanded(child: SizedBox()),
                      Text(tile.text, style: TextStyle(color: tile.textColor),),
                    ],
                  ),
                ),
                if(tile.myMenu != MyMenu.my_addtinional_doc)
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Divider(
                        color: Colors.grey.shade200, thickness: 1,))
              ],
            )
        );
      } else {
        return ListTile(
          onTap: () {
            setState(() {
              switch (tile.myMenu) {
                case MyMenu.my_services:
                  Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyServicesPage()),
                );
                break;
                case MyMenu.my_comments:
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const MyCommentsPage()),
                  );
                  break;
                case MyMenu.log_out:
                default: break;
                  break;
              }
            });
          },
          title: Row(
            children: [
              Image.asset(tile.image, width: 20, height: 20,),
              const SizedBox(width: 10,),
              Text(tile.title, style: TextStyle(color: tile.titleColor),),
              const Expanded(child: SizedBox()),
              Text(tile.text, style: TextStyle(color: tile.textColor),),
            ],),
        );
      }
    }
    else {
      return ExpansionTile(
        collapsedShape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        title: Row(
          children: [
            Image.asset(tile.image, width: 20, height: 20,),
            const SizedBox(width: 10,),
            Text(tile.title, style: TextStyle(color: tile.titleColor),),
            const Expanded(child: SizedBox()),
            Text(tile.text, style: TextStyle(color: tile.textColor),),
          ],),
        children: tile.tiles.map((tile) => buildTile(tile)).toList(),
      );
    }
  }

  Widget createDateTime() {
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
                                child: const DatePickerWidget(title: 'Dan'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: const DatePickerWidget(title: 'Gacha'),
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
  }

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

