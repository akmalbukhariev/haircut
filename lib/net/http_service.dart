import 'dart:convert';

import 'package:haircut/net/http_models/response.dart';
import 'package:haircut/net/http_models/response_register.dart';
import 'package:haircut/net/http_response/register_user.dart';
import 'package:http/http.dart' as http;

class HttpService{
   static String SERVER_URL = "http://localhost:8080/haircut/api/v1/";
   static String REGISTER_URL = "${SERVER_URL}user/register";

   static Future<ResponseRegister?> register({required RegisterUser? data}) async {
      try{
         var response = await http.post(
             Uri.parse(REGISTER_URL),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseRegister.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseRegister response = new ResponseRegister();
         response.resultMsg = e.toString();
         return response;
      }
   }
}