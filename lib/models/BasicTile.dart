
import 'dart:ui';

import 'package:flutter/material.dart';

class BasicTile{
  final String image;
  final String title;
  final Color textColor;
  final List<BasicTile> tiles;

  const BasicTile({this.image = "", required this.title, this.textColor = Colors.black, this.tiles = const[]});
}