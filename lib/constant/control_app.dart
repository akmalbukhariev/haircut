import 'package:flutter/cupertino.dart';
import 'package:haircut/data/models/app_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/http_models/register_user.dart';

class ControlApp{

  bool? hasCustomerClicked = false;
  AppInfo? appInfo;
  RegisterUser? registerUser;
  static SharedPreferences? prefs;

  static ControlApp? _instance;
  ControlApp._(){
    registerUser = RegisterUser();
  }

  static ControlApp? Instance() {
    _instance ??= ControlApp._();
    return _instance;
  }

  Future<void> SetAppInfo({required AppInfo appInfo}) async {

    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (appInfo.phone != null) {
        await prefs.setString('phone', appInfo.phone!);
      }
      if (appInfo.isCustomer != null) {
        await prefs.setString('isCustomer', appInfo.isCustomer!);
      }
      if (appInfo.isHairdresser != null) {
        await prefs.setString('isHairdresser', appInfo.isHairdresser!);
      }
    }
    catch(e){
      print('Error saving data to device: $e');
    }
  }

  Future<void> GetAppInfo() async {
    prefs = await SharedPreferences.getInstance();

    appInfo = new AppInfo();
    appInfo?.phone = prefs?.getString('phone') ?? '';
    appInfo?.isCustomer = prefs?.getString('isCustomer') ?? '';
    appInfo?.isHairdresser = prefs?.getString('isHairdresser') ?? '';
  }

  void MoveToPage(BuildContext context, StatefulWidget page){
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => page),
    );
  }
}