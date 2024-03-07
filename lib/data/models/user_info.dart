class UserInfo{
  String? phone;
  String? name;
  String? surname;
  String? password;
  String? location;
  String? language;
  String? notification;
  String? is_customer;
  String? is_hairdresser;

  UserInfo({
    this.phone,
    this.name,
    this.surname,
    this.password = "",
    this.location,
    this.language,
    this.notification,
    this.is_customer = "0",   //1 = yes, 0 = no
    this.is_hairdresser = "0" //1 = yes, 0 = no
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'surname': surname,
      'password': password,
      'location': location,
      'language': language,
      'notification': notification,
      'is_customer': is_customer,
      'is_hairdresser': is_hairdresser,
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      phone: json['phone'],
      name: json['name'],
      surname: json['surname'],
      password: json['password'],
      location: json['location'],
      language: json['language'],
      notification: json['notification'],
      is_customer: json['is_customer'],
      is_hairdresser: json['is_hairdresser'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserInfo &&
              runtimeType == other.runtimeType &&
              phone == other.phone &&
              name == other.name &&
              surname == other.surname &&
              password == other.password &&
              location == other.location &&
              language == other.language &&
              notification == other.notification &&
              is_customer == other.is_customer &&
              is_hairdresser == other.is_hairdresser;

  @override
  int get hashCode =>
      phone.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      password.hashCode ^
      location.hashCode ^
      language.hashCode ^
      notification.hashCode ^
      is_customer.hashCode ^
      is_hairdresser.hashCode;
}
