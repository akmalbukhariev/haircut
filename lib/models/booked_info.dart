import 'dart:ui';

import 'package:flutter/material.dart';

class BookedInfo{
  final String startTime;
  final String endTime;
  final String name;
  final String strServices;
  final String phone;
  final List<Color> services;

  BookedInfo({
    this.startTime = "",
    this.endTime = "",
    this.name = "",
    this.strServices = "",
    this.phone = "",
    List<Color>? services,
  }): services = services ?? [];
}