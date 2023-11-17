
import 'dart:ui';

import 'package:flutter/material.dart';
import 'customer_info.dart';

class SearchInfo extends CustomerInfo {
  SearchInfo({
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