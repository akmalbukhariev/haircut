
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_hairdresser_page.dart';
import 'hairdresser_list_page.dart';
import 'my_appointment_history_page.dart';
import 'my_room_page.dart';

class MyMainPage extends StatefulWidget{
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPage();
}

class _MyMainPage extends State<MyMainPage>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HairdresserListPage(),
    MyAppointmentHistoryPage(),
    FavoriteHairdresserPage(),
    MyRoomPage()
  ];

  void onItemTapped(int index) {
    if(index == 3){
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => MyRoomPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey, width: 1.5))),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(240, 244, 249, 1),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.red,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: createImage(image: "images/home.png"),
                    activeIcon: createImage(image: "images/home_red.png"),
                    label: 'Asosiy',
                  ),
                  BottomNavigationBarItem(
                    icon: createImage(image: "images/clipboard.png"),
                    activeIcon: createImage(image: "images/clipboard_red.png"),
                    label: "Buyurtmalar",
                  ),
                  BottomNavigationBarItem(
                    icon: createImage(image: "images/love.png"),
                    activeIcon: createImage(image: "images/love_red.png"),
                    label: "Ma'qullar",
                  ),
                  BottomNavigationBarItem(
                    icon: createImage(image: "images/user.png"),
                    //activeIcon: createImage(image: "images/month_red.png"),
                    label: 'Kabinet',
                  ),
                ],
              currentIndex: _selectedIndex,
              onTap: onItemTapped,
          )
      )
    );
  }

  Widget createImage({required String image}){
    return Image.asset(image, width: 30, height: 30,);
  }
}