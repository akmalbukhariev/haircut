class ResponseHairdresserService{
  String? resultMsg;
  String? resultCode;
  List<ServiceInfo>? resultData;

  ResponseHairdresserService({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'resultData': resultData?.map((hairdresser) => hairdresser.toJson()).toList(),
    };
  }

  factory ResponseHairdresserService.fromJson(Map<String, dynamic> json) {
    return ResponseHairdresserService(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => ServiceInfo.fromJson(item)).toList(),
    );
  }
}

class ServiceInfo{
  String? no;
  String? hairdresser_no;
  String? service;
  String? price;
  String? color;

  ServiceInfo({
    this.no,
    this.hairdresser_no,
    this.service,
    this.price,
    this.color
  });

  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'hairdresser_no': hairdresser_no,
      'service': service,
      'price': price,
      'color': color,
    };
  }

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      no: json['no'],
      hairdresser_no: json['hairdresser_no'],
      service: json['service'],
      price: json['price'],
      color: json['color'],
    );
  }
}