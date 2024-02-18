import 'dart:ui';

import 'package:flutter/material.dart';

import 'customer_info.dart';

/*class BookedInfo{
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
}*/

class BookedInfo extends CustomerInfo {
  BookedInfo({
    String date = "",
    String startTime = "",
    String endTime = "",
    String name = "",
    String strServices = "",
    String phone = "",
    List<Color>? services,
  })
      :super(
      date: date,
      startTime: startTime,
      endTime: endTime,
      name: name,
      strServices: strServices,
      phone: phone,
      services: services);
}