import 'package:haircut/net/abstract_model.dart';

class Response extends AbstractModel{
    bool? result;
    String? message;
    int? error_code;

    Response({
      this.result,
      this.message,
      this.error_code,
   });

    @override
   Map<String, dynamic> toJson() {
     return {
       'result': result,
       'message': message,
       'error_code':error_code
     };
   }

    @override
   factory Response.fromJson(Map<String, dynamic> json) {
     return Response(
       result: json['result'],
       message: json['message'],
       error_code: json['error_code'],
     );
   }
}