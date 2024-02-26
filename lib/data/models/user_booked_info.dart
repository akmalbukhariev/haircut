class UserBookedInfo{
   String? userPhone;
   String? hairdresserPhone;
   String? services;
   String? date;

   UserBookedInfo({
   this.userPhone,
   this.hairdresserPhone,
   this.services,
   this.date
 });

   Map<String, dynamic> toJson() {
      return {
         'userPhone': userPhone,
         'hairdresserPhone': hairdresserPhone,
         'services': services,
         'date': date,
      };
   }

   factory UserBookedInfo.fromJson(Map<String, dynamic> json) {
      return UserBookedInfo(
         userPhone: json['userPhone'],
         hairdresserPhone: json['hairdresserPhone'],
         services: json['services'],
         date: json['date'],
      );
   }
}