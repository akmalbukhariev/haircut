
class HairdresserInfo{
    String? image;
    double? starCount;
    String? phone;
    String? name;
    String? services;
    String? address;
    String? profession;
    bool? favorate;

  HairdresserInfo({
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