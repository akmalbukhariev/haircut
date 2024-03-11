import 'package:haircut/data/models/service_info.dart';

class HairdresserDetailInfo {
  String? name;
  String? surname;
  String? phone;
  String? address;
  String? location;
  String? language;
  String? notification;
  String? workingHour;
  String? scores;
  List<ServiceInfo>? services;
  String? imageUri;
  String? imageName;
  String? document;
  String? awards;
  String? profession;
  String? allScores;
  String? averageScores;
  String? percentageScore;

  HairdresserDetailInfo({
    this.name,
    this.surname,
    this.phone,
    this.address,
    this.location,
    this.language,
    this.notification,
    this.workingHour,
    this.scores,
    this.services,
    this.imageUri,
    this.imageName,
    this.document,
    this.awards,
    this.profession,
    this.allScores,
    this.averageScores,
    this.percentageScore
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'phone': phone,
      'address': address,
      'address': location,
      'language': language,
      'notification': notification,
      'workingHour': workingHour,
      'scores': scores,
      'services': services?.map((item) => item.toJson()).toList(),
      'imageUri': imageUri,
      'imageName': imageName,
      'document': document,
      'awards': awards,
      'profession': profession,
      'allScores': allScores,
      'averageScores': averageScores,
      'percentageScore': percentageScore,
    };
  }

  factory HairdresserDetailInfo.fromJson(Map<String, dynamic> json) {
    return HairdresserDetailInfo(
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      location: json['location'] ?? '',
      language: json['language'] ?? '',
      notification: json['notification'] ?? '',
      workingHour: json['workingHour'] ?? '',
      scores: json['scores'] ?? '',
      services: (json['services'] as List<dynamic>?)?.map((item) => ServiceInfo.fromJson(item)).toList(),
      imageUri: json['imageUri'] ?? '',
      imageName: json['imageName'] ?? '',
      document: json['document'] ?? '',
      awards: json['awards'] ?? '',
      profession: json['profession'] ?? '',
      allScores: json['allScores'] ?? '',
      averageScores: json['averageScores'] ?? '',
      percentageScore: json['percentageScore'] ?? '',
    );
  }
}