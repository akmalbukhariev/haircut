
class ResponseRegister{
  String? resultMsg;
  String? resultCode;

  ResponseRegister({
    this.resultMsg,
    this.resultCode,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
    };
  }

  @override
  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
    );
  }
}