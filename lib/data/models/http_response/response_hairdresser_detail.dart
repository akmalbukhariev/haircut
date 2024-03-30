class ResponseHairdresserDetail{
  String? resultMsg;
  String? resultCode;
  int? resultData;

  ResponseHairdresserDetail({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'hairdressers': resultData,
    };
  }

  factory ResponseHairdresserDetail.fromJson(Map<String, dynamic> json) {
    return ResponseHairdresserDetail(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: json['resultData'],
    );
  }
}