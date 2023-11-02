
import 'dart:ui';

import 'package:flutter/material.dart';

class BasicTile{
  final String image;
  final String title;
  final String text;
  final Color textColor;
  final Color titleColor;
  final List<BasicTile> tiles;

  const BasicTile({this.image = "", required this.title, this.text = "", this.textColor = Colors.black, this.titleColor = Colors.black, this.tiles = const[]});
}