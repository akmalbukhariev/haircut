import 'package:haircut/data/models/http_response/response.dart';

import '../user_info.dart';

class ResponseUserInfo{
  String? resultMsg;
  String? resultCode;
  UserInfo? userInfo;

  ResponseUserInfo({
    this.resultMsg,
    this.resultCode,
    this.userInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'userInfo': userInfo?.toJson(), // Convert UserInfo object to JSON
    };
  }

  factory ResponseUserInfo.fromJson(Map<String, dynamic> json) {
    return ResponseUserInfo(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      userInfo: json['resultData'] != null
          ? UserInfo.fromJson(json['resultData'])
          : null, // Parse UserInfo from JSON
    );
  }
}