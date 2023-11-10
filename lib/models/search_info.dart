
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:haircut/models/booked_info.dart';

class SearchInfo extends BookedInfo {
  String date;

  SearchInfo({
    this.date = "",
    String startTime = "",
    String endTime = "",
    String name = "",
    String strServices = "",
    String phone = "",
    List<Color>? services,
  })
  :super(startTime: startTime,
  endTime: endTime,
  name: name,
  strServices: strServices,
  phone: phone,
  services: services);
}