class HairdresserClientBookInfo{
   String? phone;
   String? date;
   HairdresserClientBookInfo({
     this.phone,
     this.date
   });

   Map<String, dynamic> toJson() {
     return {
       'phone': phone,
       'date': date
     };
   }

   factory HairdresserClientBookInfo.fromJson(Map<String, dynamic> json) {
     return HairdresserClientBookInfo(
       phone: json['phone'] ?? '',
       date: json['date'] ?? '',
     );
   }
}