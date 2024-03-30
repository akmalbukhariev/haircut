import 'dart:developer';

class ServiceInfo{
  String? no;
  String? color;
  String? name;
  String? price;

  ServiceInfo({
    this.no,
    this.color,
    this.name,
    this.price
  });

  ServiceInfo copyWith({
    String? no,
    String? color,
    String? name,
    String? price
  }){
    return ServiceInfo(
      no: no ?? this.no,
      color: color ?? this.color,
      name: name ?? this.name,
      price: price ?? this.price
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'color': color,
      'name': name,
      'price': price,
    };
  }

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      no: json['no'] ?? '',
      color: json['color'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
    );
  }
}