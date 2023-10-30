
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/BasicTile.dart';

final basicTiles = [
  const BasicTile(
      image: "images/userinfo.png",
      title: "Mening ma'lumotlarim",
      tiles: [
        BasicTile(title: "+998 90 999 99 99", textColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "Toshkent shaxar", textColor: Color.fromRGBO(73, 162, 191, 1)),
        BasicTile(title: "Geojoylashuv"),
        BasicTile(title: "Ish vaqti"),
        BasicTile(title: "Fotosuratlar"),
        BasicTile(title: "Ruxsatnomalar"),
        BasicTile(title: "Qo'shimcha xudjatlar"),
      ]),
  const BasicTile(
    image: "images/services.png",
    title: "Mening xizmatlarim",
  ),
  const BasicTile(
    image: "images/comments.png",
    title: "Men haqimda sharhlar",
  ),
  const BasicTile(
      image: "images/logout.png",
      title: "Chiqish",
      textColor: Colors.red
  )
];

Widget MyPage() {
  return Material(
      child: Container(
        color: const Color.fromRGBO(240, 244, 249, 1),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset("images/icon_1.png", width: 30, height: 30,),
                            const Expanded(child: SizedBox()),
                            Image.asset("images/share.png", width: 30, height: 30,),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Center(
                              child: Image.asset("images/avatar.png", width: 170, height: 170,)
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
                              decoration: TextDecoration.none)
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          starImage(im: "images/icon_13.png"),
                          starImage(im: "images/icon_13.png"),
                          starImage(im: "images/icon_13.png"),
                          starImage(im: "images/icon_14.png"),
                          starImage(im: "images/icon_14.png")
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text("ID raqam: 1234567",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: createListView(),
                  ),
                ),
              ],
            )
        ),
      )
   );
}

Widget starImage({String im = ""}){
  return Image.asset(im, width: 20, height: 20,);
}

Widget createListView(){
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

Widget buildTile(BasicTile tile){
  if(tile.tiles.isEmpty){
    if(tile.image == ""){
      return ListTile(
        title:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tile.title, style: TextStyle(color: tile.textColor),),
            if(tile.title != "Qo'shimcha xudjatlar")
              Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
          ],),
      );
    }else{
      return ListTile(
        title:
        Row(
          children: [
            Image.asset(tile.image, width: 20, height: 20,),
            const SizedBox(width: 10,),
            Text(tile.title, style: TextStyle(color: tile.textColor),)
          ],),
      );
    }
  }
  else{
    return ExpansionTile(
      title: //Text(tile.title),
      Row(
        children: [
          Image.asset(tile.image, width: 20, height: 20,),
          const SizedBox(width: 10,),
          Text(tile.title, style: TextStyle(color: tile.textColor),)
        ],),
      children: tile.tiles.map((tile) => buildTile(tile)).toList(),
    );
  }
}
