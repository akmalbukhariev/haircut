import '../user_booked_info.dart';

class ResponseOrderClient{
  String? resultMsg;
  String? resultCode;
  int? resultData;

  ResponseOrderClient({
    this.resultMsg,
    this.resultCode,
    this.resultData
   });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'resultData': resultData,
    };
  }

  factory ResponseOrderClient.fromJson(Map<String, dynamic> json) {
    return ResponseOrderClient(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: json['resultData'],
    );
  }
}