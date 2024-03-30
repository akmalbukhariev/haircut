
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haircut/presentation/pages/hairdresser/search_page.dart';
import 'package:haircut/presentation/pages/hairdresser/main_page/week_page.dart';

import '../../custom_page_route.dart';
import 'create_customer_page.dart';
import 'day_page.dart';
import '../menu_page.dart';
import 'main_page_cubit.dart';
import 'main_page_state.dart';
import 'month_page.dart';
import '../my_page/hairdresser_my_page.dart';
import '../notification_page.dart';

class HairdresserMainPage extends StatefulWidget{
  const HairdresserMainPage({super.key});

  @override
  State<HairdresserMainPage> createState() => _HairdresserMainPage();
}

class _HairdresserMainPage extends State<HairdresserMainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    MonthPage(),
    WeekPage(),
    DayPage(),
  ];

  void onItemTapped(int index) {
    if(index != 4 && index != 3) {
      setState(() {
        _selectedIndex = index;
      });
    }
    else if(index == 3){
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => AddCustomerPage()),
      );
    }
  }

  @override
  void initState() {
    context.read<MainPageCubit>().updateHeaderDate(date: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MainPageCubit, MainPageState>(
          builder: (context, state){
            return SafeArea(
                child: Column(
                  children: [
                    createHeader(state: state),
                    Expanded(
                        child: _widgetOptions.elementAt(_selectedIndex)
                    ),
                  ],
                )
            );
          }
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey, width: 1.5)
                )
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(240, 244, 249, 1),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.red,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: createImage(image: "images/month_gray.png"),
                  activeIcon: createImage(image: "images/month_red.png"),
                  label: 'Oy',
                ),
                BottomNavigationBarItem(
                  icon: createImage(image: "images/week_gray.png"),
                  activeIcon: createImage(image: "images/week.png"),
                  label: 'Hafta',
                ),
                BottomNavigationBarItem(
                  icon: createImage(image: "images/today_gray.png"),
                  activeIcon: createImage(image: "images/week.png"),
                  label: 'Kun',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "images/icon_2.png", width: 50, height: 50,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: createImage(image: "images/day_gray.png"),
                  label: 'Bugun',
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

  Widget createHeader({required MainPageState state}) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    CustomPageRoute(child: const MenuPage())
                );
              },
              child: headerImage(image: "images/menu2.png"),
            ),
            Row(
              children: [
                Text(state.strDay ?? "",//strMonth,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 20
                  ),
                ),
                const SizedBox(width: 5,),
                Text(state.strMonth ?? "",//strMonth,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const SizedBox(width: 10,),
                Text(state.strYear ?? "",
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 20
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => const NotificationPage())
                );
              },
              child: Badge(
                label: Text("3"),
                child: headerImage(image: "images/notification_color.png"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: headerImage(image: "images/search_gray.png"),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const HairdresserMyPage()),
                );
              },
              child: headerImage(image: "images/avatar.png"),
            )
          ],
        )
    );
  }

  Widget headerImage({String image = ""}) {
    return Image.asset(image, width: 30, height: 30,);
  }
}