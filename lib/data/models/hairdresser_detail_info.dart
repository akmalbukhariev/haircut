class HairdresserDetailInfo {
  String? name;
  String? surname;
  String? phone;
  String? address;
  String? workingHour;
  String? scores;
  String? services;
  String? prices;
  String? serviceColor;
  String? imageUri;
  String? imageName;
  String? document;
  String? awards;
  String? profession;
  String? averageScore;

  HairdresserDetailInfo({
    this.name,
    this.surname,
    this.phone,
    this.address,
    this.workingHour,
    this.scores,
    this.services,
    this.prices,
    this.serviceColor,
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
      'scores': scores,
      'services':services,
      'prices':prices,
      'serviceColor':serviceColor,
      'imageUri': imageUri,
      'imageName': imageName,
      'document': document,
      'awards': awards,
      'profession': profession,
      'averageScore': averageScore,
    };
  }

  factory HairdresserDetailInfo.fromJson(Map<String, dynamic> json) {
    HairdresserDetailInfo temp = HairdresserDetailInfo(
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      workingHour: json['workingHour'] ?? '',
      scores: json['scores'] ?? '',
      services: json['services'] ?? '',
      prices: json['prices'] ?? '',
      serviceColor: json['serviceColor'] ?? '',
      imageUri: json['imageUri'] ?? '',
      imageName: json['imageName'] ?? '',
      document: json['document'] ?? '',
      awards: json['awards'] ?? '',
      profession: json['profession'] ?? '',
      averageScore: json['averageScore'] ?? '',
    );
    return temp;
  }
}