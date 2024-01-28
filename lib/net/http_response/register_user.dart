import '../abstract_model.dart';

class RegisterUser extends AbstractModel{
   String? phone;
   String? name;
   String? password;
   String? location;
   int? is_customer;

   RegisterUser({
     this.phone,
     this.name,
     this.password = "",
     this.location,
     this.is_customer = 1
});

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'password':password,
      'location':location,
      'is_customer':is_customer
    };
  }

   @override
   factory RegisterUser.fromJson(Map<String, dynamic> json){
     return RegisterUser(
         phone: json['phone'],
         name: json['name'],
         password: json['password'],
         location: json['location'],
         is_customer: json['is_customer']
     );
   }
}