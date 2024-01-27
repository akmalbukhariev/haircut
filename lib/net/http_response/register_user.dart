class RegisterUser{
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
}