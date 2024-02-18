class ResponseHairdresser{
  String? resultMsg;
  String? resultCode;
  List<HairdresserItem>? resultData;

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
    int g = 0;
    return ResponseHairdresser(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => HairdresserItem.fromJson(item)).toList(),
    );
  }
}

class HairdresserItem{
  String? name;
  String? surname;
  String? phone;
  String? address;
  String? workingHour;
  String? score;
  String? services;
  String? imageUri;
  String? imageName;
  String? document;
  String? awards;
  String? profession;
  String? averageScore;

  HairdresserItem({
    this.name,
    this.surname,
    this.phone,
    this.address,
    this.workingHour,
    this.score,
    this.services,
    this.imageUri,
    this.imageName,
    this.document,
    this.awards,
    this.profession,
    this.averageScore
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'phone': phone,
      'address': address,
      'workingHour': workingHour,
      'score': score,
      'services':services,
      'imageUri': imageUri,
      'imageName': imageName,
      'document': document,
      'awards': awards,
      'profession': profession,
      'averageScore': averageScore,
    };
  }

  factory HairdresserItem.fromJson(Map<String, dynamic> json) {
    return HairdresserItem(
      name: json['name'],
      surname: json['surname'],
      phone: json['phone'],
      address: json['address'],
      workingHour: json['workingHour'],
      score: json['workingHour'],
      services: json['services'],
      imageUri: json['imageUri'],
      imageName: json['imageName'],
      document: json['document'],
      awards: json['awards'],
      profession: json['profession'],
      averageScore: json['averageScore'],
    );
  }
}