class ResponseAddFavoriteHairdresser{
  String? resultMsg;
  String? resultCode;
  int? resultData;

  ResponseAddFavoriteHairdresser({
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

  factory ResponseAddFavoriteHairdresser.fromJson(Map<String, dynamic> json) {
    return ResponseAddFavoriteHairdresser(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: json['resultData'],
    );
  }
}