import '../hairdresser_info.dart';

class ResponseHairdresserInfo{
  String? resultMsg;
  String? resultCode;
  HairdresserInfo? resultData;

  ResponseHairdresserInfo({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'userInfo': resultData?.toJson(), // Convert UserInfo object to JSON
    };
  }

  factory ResponseHairdresserInfo.fromJson(Map<String, dynamic> json) {
    return ResponseHairdresserInfo(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: json['resultData'] != null
          ? HairdresserInfo.fromJson(json['resultData'])
          : null, // Parse UserInfo from JSON
    );
  }
}