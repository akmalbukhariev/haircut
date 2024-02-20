
import '../hairdresser_detail_info.dart';

class ResponseDetailHairdresser{
  String? resultMsg;
  String? resultCode;
  HairdresserDetailInfo? resultData;

  ResponseDetailHairdresser({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'hairdressers': resultData?.toJson(),
    };
  }

  factory ResponseDetailHairdresser.fromJson(Map<String, dynamic> json) {
    return ResponseDetailHairdresser(
      resultMsg: json['resultMsg'] ?? '',
      resultCode: json['resultCode'] ?? '',
      resultData: json['resultData'] != null ? HairdresserDetailInfo.fromJson(json['resultData']) : null,
    );
  }
}