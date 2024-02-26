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