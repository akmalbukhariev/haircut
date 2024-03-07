class AddFavoriteHairdresserInfo{
  String? userPhone;
  String? hairdresserPhone;

  AddFavoriteHairdresserInfo({
    this.userPhone,
    this.hairdresserPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'userPhone': userPhone,
      'hairdresserPhone': hairdresserPhone,
    };
  }

  factory AddFavoriteHairdresserInfo.fromJson(Map<String, dynamic> json) {
    return AddFavoriteHairdresserInfo(
      userPhone: json['userPhone'],
      hairdresserPhone: json['hairdresserPhone'],
    );
  }
}