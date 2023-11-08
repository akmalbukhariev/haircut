
import 'package:flutter/material.dart';

enum MenuId{
  none,
  report,
  privacy,
  activeDevice,
  blackList,
  settings,
  language,
  animation,
  nigtMode,
  notification,
  contactUs
}

class C {
  int x;

  C(this.x);
}

class MenuItem{
  final String image;
  final String title;
  final String text;
  final Color textColor;
  final Color titleColor;
  final List<MenuItem> tiles;
  bool animationOn;
  bool nightModeOn;
  final MenuId menuId;

  MenuItem({this.image = "",
    required this.title,
    this.text = "",
    this.textColor = Colors.black,
    this.titleColor = Colors.black,
    this.menuId = MenuId.none,
    this.animationOn = false,
    this.nightModeOn = false,
    this.tiles = const[]});
}