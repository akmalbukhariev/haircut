
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content_views/child_widgets.dart';
import '../../models/menu_item.dart';

var menuList = [
  MenuItem(
    image: "images/report.png",
    title: "Hisobot",
    titleColor: const Color.fromRGBO(102, 102, 102, 1),
    menuId: MenuId.report
  ),
  MenuItem(
      image: "images/document.png",
      title: "Maxfiylik",
      titleColor: const Color.fromRGBO(102, 102, 102, 1),
      menuId: MenuId.privacy,
    tiles: [
      MenuItem(
        title: "Faol qurilmalar",
        text: "2",
        textColor: const Color.fromRGBO(68, 68, 68, 1),
        menuId: MenuId.activeDevice,
      ),
      MenuItem(
        title: "Qora ro'yxat",
        text: "0",
        textColor: const Color.fromRGBO(68, 68, 68, 1),
        menuId: MenuId.blackList,
      )
    ]
  ),
  MenuItem(
    image: "images/settings.png",
    title: "Sozlamalar",
    titleColor: const Color.fromRGBO(102, 102, 102, 1),
    menuId: MenuId.settings,
    tiles: [
        MenuItem(
          title: "Til",
          text: "O'zbekcha",
          textColor: const Color.fromRGBO(68, 68, 68, 1),
          menuId: MenuId.language,
          animationOn: true
        ),
        MenuItem(
          title: "Animatsya",
          textColor: const Color.fromRGBO(68, 68, 68, 1),
          menuId: MenuId.animation,
        ),
        MenuItem(
          title: "Tungi rejim",
          textColor: const Color.fromRGBO(68, 68, 68, 1),
          menuId: MenuId.nigtMode,
        ),
        MenuItem(
          title: "Xabardor qilish",
          text: "5 daqiqa oldin",
          textColor: const Color.fromRGBO(68, 68, 68, 1),
          menuId: MenuId.notification,
        )
      ]
  ),
  MenuItem(
    image: "images/online_chat.png",
    title: "Bizga qo'ng'iroq qilish.",
    titleColor: const Color.fromRGBO(102, 102, 102, 1),
    menuId: MenuId.contactUs,
  ),
];

enum LanguageId {
  uzbek_latin,
  uzbek_cyrillic,
  ruski,
  english
}

enum NotificationId{
  none,
  _5_minute,
  _10_minute,
  _15_minute,
  _20_minute,
  _30_minute,
  _45_minute,
  _1_hour,
  _1_30_hour,
  _2_hour,
}

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  bool _languageVisible = false;
  bool _notificationVisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            navigationBar(context: context, title: "Menyu"),
                            const SizedBox(height: 20,),
                            Expanded(
                                child: Stack(
                                  children: [
                                    Container(color: const Color.fromRGBO(
                                        240, 244, 249, 1),),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 30),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    10)
                                            ),
                                            child: SingleChildScrollView(
                                              child: createListView(),
                                            )
                                        )
                                    )
                                  ],)
                            )
                          ],
                        )
                    ),
                  ),
                  animateWidget(
                      widget: createLanguage(),
                      context: context,
                      visible: _languageVisible),
                  animateWidget(
                      widget: createNotification(),
                      context: context,
                      visible: _notificationVisible),
                ])
        )
    );
  }

  Widget createListView() {
    return Column(
      children: [
        buildTile(menuList[0]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(menuList[1]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(menuList[2]),
        Divider(height: 1, color: Colors.grey.shade400,),
        buildTile(menuList[3]),
      ],
    );
  }

  Widget buildTile(MenuItem tile) {
    if (tile.tiles.isEmpty) {
      if (tile.image == "") {
        String strOnOffImage = "images/icon_5.png";
        if (tile.menuId == MenuId.animation) {
          if (tile.animationOn) {
            strOnOffImage = "images/icon_6.png";
          }
        }
        else if (tile.menuId == MenuId.nigtMode) {
          if (tile.nightModeOn) {
            strOnOffImage = "images/icon_6.png";
          }
        }

        return Container(
            color: const Color.fromRGBO(249, 249, 249, 1),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    switch (tile.menuId) {
                      case MenuId.activeDevice:
                        break;
                      case MenuId.blackList:
                        break;
                      case MenuId.language:
                        setState(() {
                          _languageVisible = !_languageVisible;
                        });
                        break;
                      case MenuId.animation:
                        break;
                      case MenuId.nigtMode:
                        break;
                      case MenuId.notification:
                        setState(() {
                          _notificationVisible = !_notificationVisible;
                        });
                        break;
                      default:
                        break;
                    }
                  },
                  title: Row(
                    children: [
                      Text(
                        tile.title, style: TextStyle(color: tile.titleColor),),
                      const Expanded(child: SizedBox()),

                      if(tile.menuId == MenuId.language ||
                          tile.menuId == MenuId.notification)
                        Text(
                          tile.text, style: TextStyle(color: tile.textColor),),

                      if(tile.menuId == MenuId.animation ||
                          tile.menuId == MenuId.nigtMode)
                        GestureDetector(
                          onTap: () {
                            if (tile.menuId == MenuId.animation) {
                              if (tile.animationOn) {
                                createOffOn(on: true);
                                tile.animationOn = false;
                              }
                              else {
                                createOffOn(on: false);
                                tile.animationOn = true;
                              }
                            }
                            else if (tile.menuId == MenuId.nigtMode) {
                              if (tile.nightModeOn) {
                                createOffOn(on: false);
                                tile.nightModeOn = false;
                              }
                              else {
                                createOffOn(on: true);
                                tile.nightModeOn = true;
                              }
                            }
                            setState(() {});
                          },
                          child: Image.asset(
                            strOnOffImage, width: 50, height: 50,),
                        )
                    ],
                  ),
                ),
                if(tile.menuId != MenuId.blackList &&
                    tile.menuId != MenuId.notification)
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Divider(
                        color: Colors.grey.shade200, thickness: 1,))
              ],)
        );
      }
      else {
        return Column(
          children: [
            ListTile(
                onTap: () {
                  switch (tile.menuId) {
                    case MenuId.report:
                      break;
                    case MenuId.contactUs:
                      break;
                    default:
                      break;
                  }
                },
                title: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(tile.image, width: 20, height: 20,),
                        const SizedBox(width: 10,),
                        Text(tile.title,
                          style: TextStyle(color: tile.titleColor),),
                        const Expanded(child: SizedBox()),
                        Text(
                          tile.text, style: TextStyle(color: tile.textColor),),
                      ],),
                  ],)
            ),
            //Divider(color: Colors.grey.shade200, thickness: 1,),
          ],);
      }
    }
    else {
      return /*Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            shape: Border.all(color: Colors.red),
            title: Row(
              children: [
                Image.asset(tile.image, width: 20, height: 20,),
                const SizedBox(width: 10,),
                Text(tile.title, style: TextStyle(color: tile.titleColor),),
                const Expanded(child: SizedBox()),
                Text(tile.text, style: TextStyle(color: tile.textColor),),
              ],
            ),
            children: tile.tiles.map((tile) => buildTile(tile)).toList(),
          )
      );*/
        ExpansionTile(
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
            ],
          ),
          children: tile.tiles.map((tile) => buildTile(tile)).toList(),
        );
    }
  }

  Widget createOffOn({bool on = false}) {
    String strImage = on ? "images/icon_6.png" : "images/icon_5.png";
    return Image.asset(strImage, width: 50, height: 50,);
  }

  Widget createLanguage() {
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
                              _languageVisible = !_languageVisible;
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
                          child: Text("Tilni tanlang",
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
                            languageItem(name: "Uzbek",
                                languageId: LanguageId.uzbek_latin),
                            languageItem(name: "Узбекча",
                                languageId: LanguageId.uzbek_cyrillic),
                            languageItem(name: "Ruski",
                                languageId: LanguageId.ruski),
                            languageItem(name: "English",
                                languageId: LanguageId.english),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child:
                            Center(
                                child: saveButton(
                                    onPressedCallBack: () {
                                      setState(() {
                                        _languageVisible = !_languageVisible;
                                      });
                                    }
                                )
                            )
                        ),
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 20,)
            ])
    );
  }

  LanguageId? _languageId = LanguageId.uzbek_latin;
  Widget languageItem({String name = "", required LanguageId languageId}) {
    return Column(
      children: [
        RadioListTile<LanguageId>(
          activeColor: const Color.fromRGBO(17, 138, 178, 1),
          title: Text(name, style: const TextStyle(
              fontSize: 18, color: Color.fromRGBO(102, 102, 102, 1)),),
          value: languageId,
          groupValue: _languageId,
          onChanged: (LanguageId? value) {
            setState(() {
              _languageId = value;
            });
          },
        ),
        if(languageId != LanguageId.english)
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                height: 2, color: Color.fromRGBO(220, 220, 220, 1),)
          )
      ],
    );
  }

  Widget createNotification() {
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
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _notificationVisible = !_notificationVisible;
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
                            child: Text("Oldindan xabardor qilish vaqti",
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
                              notificationItem(name: "Kerak emas",
                                  notificationId: NotificationId.none),
                              notificationItem(name: "5 daqiqa",
                                  notificationId: NotificationId._5_minute),
                              notificationItem(name: "10 daqiqa oldin",
                                  notificationId: NotificationId._10_minute),
                              notificationItem(name: "15 daqiqa oldin",
                                  notificationId: NotificationId._15_minute),
                              notificationItem(name: "20 daqiqa oldin",
                                  notificationId: NotificationId._20_minute),
                              notificationItem(name: "30 daqiqa oldin",
                                  notificationId: NotificationId._30_minute),
                              notificationItem(name: "45 daqiqa oldin",
                                  notificationId: NotificationId._45_minute),
                              notificationItem(name: "1 soat oldin",
                                  notificationId: NotificationId._1_hour),
                              notificationItem(name: "1 soat 30 daqiqa oldin",
                                  notificationId: NotificationId._1_30_hour),
                              notificationItem(name: "2 soat oldin",
                                  notificationId: NotificationId._2_hour),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child:
                              Center(
                                  child: saveButton(
                                      onPressedCallBack: () {
                                        setState(() {
                                          _notificationVisible =
                                          !_notificationVisible;
                                        });
                                      }
                                  )
                              )
                          ),
                        ],
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,)
            ])
    );
  }

  NotificationId? _notificationId = NotificationId._5_minute;
  Widget notificationItem({String name = "", required NotificationId notificationId}) {
    return Column(
      children: [
        RadioListTile<NotificationId>(
          activeColor: const Color.fromRGBO(17, 138, 178, 1),
          title: Text(name, style: const TextStyle(
              fontSize: 18, color: Color.fromRGBO(102, 102, 102, 1)),),
          value: notificationId,
          groupValue: _notificationId,
          onChanged: (NotificationId? value) {
            setState(() {
              _notificationId = value;
            });
          },
        ),
        if(notificationId != NotificationId._2_hour)
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Divider(
                height: 2, color: Color.fromRGBO(220, 220, 220, 1),)
          )
      ],
    );
  }
}

