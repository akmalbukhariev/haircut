
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_listview_menu.dart';

Widget MyPage() {
  return Drawer(
      child: Container(
        //padding: EdgeInsets.only(top: 60),
        color: const Color.fromRGBO(240, 244, 250, 1),
        child: Column(
          children: [
            Stack(children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Row(
                  children: [
                    Image.asset("images/icon_1.png", width: 45, height: 45,),
                    const Expanded(child: SizedBox(),),
                    Image.asset("images/share.png", width: 35, height: 35,),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 65),
                  child: Center(
                    child: Image.asset(
                      "images/avatar.png", width: 180, height: 180,),
                  )
              ),
            ],),
            const SizedBox(height: 10,),
            Column(
              children: [
                const Text("Akmal Bukhariev",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    starImage(im: "images/icon_13.png"),
                    starImage(im: "images/icon_13.png"),
                    starImage(im: "images/icon_13.png"),
                    starImage(im: "images/icon_14.png"),
                    starImage(im: "images/icon_14.png"),
                  ],
                ),
                const SizedBox(height: 10,),
                const Text("ID raqam 1234567",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      color: Colors.grey,
                      fontSize: 15),),
              ],
            ),
            /*Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: createListView_1(),
                  )
                )
            ),*/
            createTileList()
          ],
        ),
      )
  );
}

Widget starImage({String im = ""}){
  return Image.asset(im, width: 25, height: 25,);
}

Widget listItemIcon({String im = ""}) {
  return Image.asset(im,
    width: 30,
    height: 30,
  );
}

Widget listItemText({String txt = ""}) {
  return Text(txt,
    style: const TextStyle(
      color: Color.fromRGBO(102, 102, 102, 1),
      fontSize: 15,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget createListView() {
  return ListView(
    children: [
      Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            listItemIcon(im: "images/userinfo.png"),
            const SizedBox(width: 10,),
            listItemText(txt: "Mening Ma'lumotlarim"),
            const Expanded(child: SizedBox()),
            listItemIcon(im: "images/icon_8.png")
          ],
        ),
      ),
      Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            listItemIcon(im: "images/userinfo.png"),
            const SizedBox(width: 10,),
            listItemText(txt: "Mening Ma'lumotlarim"),
            const Expanded(child: SizedBox()),
            listItemIcon(im: "images/icon_8.png")
          ],
        ),
      )
    ],
  );
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget createListView_1() {
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('Entry ${entries[index]}')),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

Widget createTileList() {
  return Column(
    children: [
      ExpansionTile(
        title: Text("Mening ma'lumotlarim"),
        leading: listItemIcon(im: "images/userinfo.png"),
        children: [
          ListTile(title: Text("+998977686265"),),
          ListTile(title: Text("Toshkent shaxar"),),
          ListTile(title: Text("Geo joylashuv"),),
          ListTile(title: Text("Ish vaqti"),),
        ],
      ),
    ],
  );
}