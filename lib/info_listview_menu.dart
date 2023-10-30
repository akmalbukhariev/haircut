
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*class Menu {
  final String name;
  final IconData icon;
  List<Menu> subMenu = [];

  Menu(this.name, this.subMenu, this.icon);

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });
    }
  }
}*/

class ExpandableListView extends StatefulWidget {
  final String title;

  const ExpandableListView({super.key, required this.title});

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: <Widget>[
           Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
          ExpandableContainer(
              expanded: expandFlag,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration:
                    BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey), color: Colors.black),
                    child: ListTile(
                      title: Text(
                        "Cool $index",
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.local_pizza,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: 15,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        child: child,
        decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}