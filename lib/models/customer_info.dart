
import 'dart:ui';

class CustomerInfo{
  String date;
  final String startTime;
  final String endTime;
  final String name;
  final String strServices;
  final String phone;
  final List<Color> services;

  CustomerInfo({
    this.date = "",
    this.startTime = "",
    this.endTime = "",
    this.name = "",
    this.strServices = "",
    this.phone = "",
    List<Color>? services,
  }): services = services ?? [];
}