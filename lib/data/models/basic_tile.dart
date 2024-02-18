
import 'dart:ui';

import 'package:flutter/material.dart';

enum MyMenu {
  none,
  my_info,
  my_profession,
  my_phone,
  my_address,
  my_location,
  my_work_time,
  my_photos,
  my_license,
  my_addtinional_doc,
  my_services,
  my_comments,
  log_out
}

class BasicTile {
  final String image;
  final String title;
  final String text;
  final Color textColor;
  final Color titleColor;
  final List<BasicTile> tiles;
  final MyMenu myMenu;

  const BasicTile({this.image = "",
    required this.title,
    this.text = "",
    this.textColor = Colors.black,
    this.titleColor = Colors.black,
    this.myMenu = MyMenu.none,
    this.tiles = const[]});
}