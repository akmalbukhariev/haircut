import '../hairdresser_detail_info.dart';

class ResponseHairdresser{
  String? resultMsg;
  String? resultCode;
  List<HairdresserDetailInfo>? resultData;

  ResponseHairdresser({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'hairdressers': resultData?.map((hairdresser) => hairdresser.toJson()).toList(),
    };
  }

  factory ResponseHairdresser.fromJson(Map<String, dynamic> json) {
    return ResponseHairdresser(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => HairdresserDetailInfo.fromJson(item)).toList(),
    );
  }
}