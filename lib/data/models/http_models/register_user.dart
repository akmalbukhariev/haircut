import '../abstract_model.dart';

class RegisterUser extends AbstractModel{
   String? phone;
   String? name;
   String? surName;
   String? password;
   String? location;
   String? is_customer;
   String? is_hairdresser;

   RegisterUser({
     this.phone,
     this.name,
     this.surName,
     this.password = "",
     this.location,
     this.is_customer = "0",   //1 = yes, 0 = no
     this.is_hairdresser = "0" //1 = yes, 0 = no
});

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'surName': surName,
      'password':password,
      'location':location,
      'is_customer':is_customer,
      'is_hairdresser':is_hairdresser
    };
  }

   @override
   factory RegisterUser.fromJson(Map<String, dynamic> json){
     return RegisterUser(
         phone: json['phone'],
         name: json['name'],
         surName: json['surName'],
         password: json['password'],
         location: json['location'],
         is_customer: json['is_customer'],
         is_hairdresser: json['is_hairdresser']
     );
   }
}