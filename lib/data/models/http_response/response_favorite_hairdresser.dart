class ResponseFavoriteHairdresser{
  String? resultMsg;
  String? resultCode;
  List<FavoriteInfo>? resultData;

  ResponseFavoriteHairdresser({
    this.resultMsg,
    this.resultCode,
    this.resultData,
  });

  Map<String, dynamic> toJson() {
    return {
      'resultMsg': resultMsg,
      'resultCode': resultCode,
      'resultData': resultData?.map((item) => item.toJson()).toList(),
    };
  }

  factory ResponseFavoriteHairdresser.fromJson(Map<String, dynamic> json) {
    return ResponseFavoriteHairdresser(
      resultMsg: json['resultMsg'],
      resultCode: json['resultCode'],
      resultData: (json['resultData'] as List<dynamic>?)?.map((item) => FavoriteInfo.fromJson(item)).toList(),
    );
  }
}

class FavoriteInfo{
  String? image;
  String? name;
  String? profession;

  FavoriteInfo({
    this.image,
    this.name,
    this.profession
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'profession': profession,
    };
  }

  factory FavoriteInfo.fromJson(Map<String, dynamic> json) {
    return FavoriteInfo(
      image: json['image'],
      name: json['name'],
      profession: json['profession'],
    );
  }
}