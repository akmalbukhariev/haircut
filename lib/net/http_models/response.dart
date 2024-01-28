import 'package:haircut/net/abstract_model.dart';

class Response extends AbstractModel{
    String? resultMsg;
    String? resultCode;

    Response({
      this.resultMsg,
      this.resultCode,
   });

    @override
   Map<String, dynamic> toJson() {
     return {
       'resultMsg': resultMsg,
       'resultCode': resultCode,
     };
   }

    @override
   factory Response.fromJson(Map<String, dynamic> json) {
     return Response(
       resultMsg: json['resultMsg'],
       resultCode: json['resultCode'],
     );
   }
}