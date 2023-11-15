
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haircut/pages/main_page/week_page.dart';

import '../custom_page_route.dart';
import '../my_page/my_page.dart';
import 'day_page.dart';
import 'menu_page.dart';
import 'month_page.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    MonthPage(),
    WeekPage(),
    DayPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              createHeader(),
              Expanded(
                  child: _widgetOptions.elementAt(_selectedIndex)
              ),
            ],
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
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
                "images/icon_2.png", width: 80, height: 80,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: createImage(image: "images/day_gray.png"),
              label: 'Bugun',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }

  Widget createImage({required String image}){
    return Image.asset(image, width: 30, height: 30,);
  }

  Widget createHeader() {
    final String strMonth = "yanvar";
    final String strYear = "2023";
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
                Text(strMonth,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const SizedBox(width: 10,),
                Text(strYear,
                  style: const TextStyle(
                      color: Color.fromRGBO(17, 138, 138, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 20
                  ),
                ),
              ],
            ),
            headerImage(image: "images/notification.png"),
            headerImage(image: "images/search_gray.png"),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyPage()),
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

/*class _MainPage extends State<MainPage>{

  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState(){
    _pages = [
      {
        'page': Cart(),
      },
      {
        'page': Cart1(),
      },
      {
        'page': Cart2(),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).highlightColor,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed),
                  label: 'Cart1',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Cart2',
                ),
              ],
              )
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2),
       child: FloatingActionButton(
         hoverElevation: 10,
         splashColor: Colors.grey,
         tooltip: 'Search',
         elevation: 8,
         child: Icon(Icons.search),
         onPressed: () => setState(() {
           _selectedPageIndex = 2;
         }),
        )
      )
    );
  }
}*/