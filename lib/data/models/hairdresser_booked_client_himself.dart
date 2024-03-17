class HairdresserBookedClientHimSelf{
   String? hairdresser_phone;
   String? client_phone;
   String? client_name;
   String? service;
   String? date;
   String? note;

   HairdresserBookedClientHimSelf({
     this.hairdresser_phone,
     this.client_phone,
     this.client_name,
     this.service,
     this.date,
     this.note
   });

   Map<String, dynamic> toJson() {
     return {
       'hairdresser_phone': hairdresser_phone,
       'client_phone': client_phone,
       'client_name': client_name,
       'service': service,
       'date': date,
       'note': note,
     };
   }

   factory HairdresserBookedClientHimSelf.fromJson(Map<String, dynamic> json) {
     return HairdresserBookedClientHimSelf(
       hairdresser_phone: json['hairdresser_phone'],
       client_phone: json['client_phone'],
       client_name: json['client_name'],
       service: json['service'],
       date: json['date'],
       note: json['note'],
     );
   }
}