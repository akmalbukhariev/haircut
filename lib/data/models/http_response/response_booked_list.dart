class ResponseBookedList{
  String? resultMsg;
  String? resultCode;
  List<DataInfo>? resultData;

  ResponseBookedList({
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

  factory ResponseBookedList.fromJson(Map<String, dynamic> json) {
    return ResponseBookedList(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => DataInfo.fromJson(item)).toList(),
    );
  }
}

class DataInfo{
  String? name;
  String? services;
  String? colors;
  String? startTime;
  String? endTime;
  String? date;

  DataInfo({
    this.name,
    this.services,
    this.colors,
    this.startTime,
    this.endTime,
    this.date
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'services': services,
      'colors': colors,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
    };
  }

  factory DataInfo.fromJson(Map<String, dynamic> json) {
    return DataInfo(
      name: json['name'],
      services: json['services'],
      colors: json['colors'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      date: json['date'],
    );
  }
}