
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content_views/child_widgets.dart';
import '../../models/menu_item.dart';

var menuList = [
  MenuItem(
    image: "images/report.png",
    title: "Hisobot",
    titleColor: Color.fromRGBO(102, 102, 102, 1),
    menuId: MenuId.report
  ),
  MenuItem(
      image: "images/document.png",
      title: "Maxfiylik",
      titleColor: Color.fromRGBO(102, 102, 102, 1),
      menuId: MenuId.privacy,
    tiles: [
        MenuItem(
        title: "Faol qurilmalar",
        text: "2",
        textColor: Color.fromRGBO(73, 162, 191, 1),
        menuId: MenuId.activeDevice,
      ),
      MenuItem(
        title: "Qora ro'yxat",
        text: "0",
        textColor: Color.fromRGBO(73, 162, 191, 1),
        menuId: MenuId.blackList,
      )
    ]
  ),
  MenuItem(
    image: "images/settings.png",
    title: "Sozlamalar",
    menuId: MenuId.settings,
      tiles: [
        MenuItem(
          title: "Til",
          text: "O'zbekcha",
          textColor: Color.fromRGBO(73, 162, 191, 1),
          menuId: MenuId.language,
          animationOn: true
        ),
        MenuItem(
          title: "Animatsya",
          menuId: MenuId.animation,
        ),
        MenuItem(
          title: "Tungi rejim",
          menuId: MenuId.nigtMode,
        ),
        MenuItem(
          title: "Xabardor qilish",
          text: "5 daqiqa oldin",
          textColor: Color.fromRGBO(73, 162, 191, 1),
          menuId: MenuId.notification,
        )
      ]
  ),
  MenuItem(
    image: "images/online_chat.png",
    title: "Bizga qo'ng'iroq qilish.",
    menuId: MenuId.contactUs,
  ),
];

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
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
                                    Container(color: const Color.fromRGBO(240, 244, 249, 1),),
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
        if(tile.menuId == MenuId.animation){
             if(tile.animationOn) {
               strOnOffImage = "images/icon_6.png";
             }
        }
        else if(tile.menuId == MenuId.nigtMode){
          if(tile.nightModeOn) {
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
                        break;
                      case MenuId.animation:
                        break;
                      case MenuId.nigtMode:
                        break;
                      case MenuId.notification:
                        break;
                      default:
                        break;
                    }
                  },
                  title: Row(
                    children: [
                      Text(tile.title, style: TextStyle(color: tile.titleColor),),
                      const Expanded(child: SizedBox()),

                      if(tile.menuId == MenuId.language || tile.menuId == MenuId.notification)
                        Text(tile.text, style: TextStyle(color: tile.textColor),),

                      if(tile.menuId == MenuId.animation || tile.menuId == MenuId.nigtMode)
                        GestureDetector(
                          onTap: (){
                            if(tile.menuId == MenuId.animation) {
                              if (tile.animationOn) {
                                createOffOn(on: true);
                                tile.animationOn = false;
                              }
                              else{
                                createOffOn(on: false);
                                tile.animationOn = true;
                              }
                            }
                            else if(tile.menuId == MenuId.nigtMode){
                              if (tile.nightModeOn) {
                                createOffOn(on: false);
                                tile.nightModeOn = false;
                              }
                              else{
                                createOffOn(on: true);
                                tile.nightModeOn = true;
                              }
                            }
                            setState(() {
                            });
                          },
                          child: Image.asset(strOnOffImage, width: 50, height: 50,),
                        )
                    ],
                  ),
                ),
                if(tile.menuId != MenuId.blackList && tile.menuId != MenuId.notification)
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Divider(color: Colors.grey.shade200, thickness: 1,))
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
                        Text(tile.title, style: TextStyle(color: tile.titleColor),),
                        const Expanded(child: SizedBox()),
                        Text(tile.text, style: TextStyle(color: tile.textColor),),
                      ],),
                  ],)
            ),
            //Divider(color: Colors.grey.shade200, thickness: 1,),
        ],) ;
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

  Widget createOffOn({bool on = false}){
    String strImage = on ? "images/icon_6.png" : "images/icon_5.png";
    return Image.asset(strImage, width: 50, height: 50,);
  }
}

