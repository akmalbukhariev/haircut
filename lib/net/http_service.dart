import 'dart:convert';

import 'package:haircut/net/http_models/response.dart';
import 'package:haircut/net/http_models/response_register.dart';
import 'package:haircut/net/http_response/register_user.dart';
import 'package:http/http.dart' as http;

class HttpService{
   static String SERVER_URL = "http://localhost:8080/haircut/api/v1";
   static String REGISTER_URL = "${SERVER_URL}user/login";

   Future<ResponseRegister?> register({required RegisterUser data}) async {
      try{
         var response = await http.get(REGISTER_URL as Uri);
         if (response.statusCode == 200){
            return Response.fromJson(json.decode(response.body)) as ResponseRegister;
         }
      }
      catch(e){

      }
   }
}