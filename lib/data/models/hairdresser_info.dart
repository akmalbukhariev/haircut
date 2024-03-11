
class HairdresserInfoForUser{
    String? image;
    double? starCount;
    String? phone;
    String? name;
    String? services;
    String? address;
    String? profession;
    bool? favorate;

    HairdresserInfoForUser({
    this.image,
    this.starCount = 0.0,
    this.phone,
    this.name,
    this.services,
    this.address,
    this.profession,
    this.favorate = false
  });
}

class HairdresserInfo{
  String? phone;
  String? name;
  String? surname;
  String? language;
  String? notification;

  HairdresserInfo({
    this.phone,
    this.name,
    this.surname,
    this.language,
    this.notification,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'surname': surname,
      'language': language,
      'notification': notification,
    };
  }

  factory HairdresserInfo.fromJson(Map<String, dynamic> json) {
    return HairdresserInfo(
      phone: json['phone'],
      name: json['name'],
      surname: json['surname'],
      language: json['language'],
      notification: json['notification'],
    );
  }
}