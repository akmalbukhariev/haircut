class ResponseHairdresserBookedClient{
  String? resultMsg;
  String? resultCode;
  List<HairdresserBookedClient>? resultData;

  ResponseHairdresserBookedClient({
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

  factory ResponseHairdresserBookedClient.fromJson(Map<String, dynamic> json) {
    return ResponseHairdresserBookedClient(
      resultMsg: json['resultMsg'] ?? '',
      resultCode: json['resultCode'] ?? '',
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => HairdresserBookedClient.fromJson(item)).toList(),
    );
  }
}

class HairdresserBookedClient{
   String? name;
   String? surname;
   String? phone;
   String? services;
   String? colors;
   String? startTime;
   String? endTime;
   String? date;

   HairdresserBookedClient({
     this.name,
     this.surname,
     this.phone,
     this.services,
     this.colors,
     this.startTime,
     this.endTime,
     this.date
   });

   Map<String, dynamic> toJson() {
     return {
       'name': name,
       'surname': surname,
       'phone': phone,
       'services': services,
       'colors': colors,
       'startTime': startTime,
       'endTime': endTime,
       'date': date
     };
   }

   factory HairdresserBookedClient.fromJson(Map<String, dynamic> json) {
     return HairdresserBookedClient(
         name: json['name'],
         surname: json['surname'],
         phone: json['phone'],
         services: json['services'],
         colors: json['colors'],
         startTime: json['startTime'],
         endTime: json['endTime'],
         date: json['date']
     );
   }
}