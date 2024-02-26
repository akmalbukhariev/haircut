import 'dart:convert';

import 'package:haircut/data/models/http_response/response_user_info.dart';
import 'package:haircut/data/models/user_info.dart';
import 'package:http/http.dart' as http;

import '../models/http_response/response_detail_hairdresser.dart';
import '../models/http_response/response_hairdresser.dart';
import '../models/http_response/response_order_client.dart';
import '../models/http_response/response_register.dart';
import '../models/http_models/register_user.dart';
import '../models/user_booked_info.dart';

class HttpService{
   static String SERVER_URL = "http://localhost:8080/haircut/api/v1/";
   static String URL_REGISTER = "${SERVER_URL}user/register";
   static String URL_GET_USER = "${SERVER_URL}user/getUser/";
   static String URL_GET_ALL_HAIRDRESSER = "${SERVER_URL}hairdresser/getAllHairdresserForUserMainPage";
   static String URL_GET_DETAIL_HAIRDRESSER = "${SERVER_URL}hairdresser/getHairdresserDetailInfo/";
   static String URL_INSERT_BOOKED_CLIENT = "${SERVER_URL}hairdresser/insertBookedClient";
   static String URL_UPDATE_USER_CUSTOMER = "${SERVER_URL}user/updateUserCustomer";
   static String URL_UPDATE_USER_HAIRDERSSER = "${SERVER_URL}user/updateUserHairdreser";

   static Future<ResponseRegister?> register({required RegisterUser? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_REGISTER),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseRegister.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseRegister response = ResponseRegister();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseUserInfo?> getUserInfo({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_USER$phone'));
         if(response.statusCode == 200) {
           return ResponseUserInfo.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseUserInfo response = ResponseUserInfo();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseUserInfo?> updateUserCustomer({required UserInfo? data}) async {
      try{
         var response = await http.put(
             Uri.parse(URL_UPDATE_USER_CUSTOMER),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseUserInfo.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseUserInfo response = ResponseUserInfo();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseUserInfo?> updateUserHairdresser({required UserInfo? data}) async {
      try{
         var response = await http.put(
             Uri.parse(URL_UPDATE_USER_HAIRDERSSER),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseUserInfo.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseUserInfo response = ResponseUserInfo();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseHairdresser?> getAllHairdresserInfo() async {
      try{
         var response = await http.get(Uri.parse(URL_GET_ALL_HAIRDRESSER));
         if(response.statusCode == 200) {
            return ResponseHairdresser.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseHairdresser response = ResponseHairdresser();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseDetailHairdresser?> getDetailHairdresserInfo({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_DETAIL_HAIRDRESSER$phone'));
         if(response.statusCode == 200) {
            return ResponseDetailHairdresser.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseDetailHairdresser response = ResponseDetailHairdresser();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseOrderClient?> bookClient({required UserBookedInfo? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_INSERT_BOOKED_CLIENT),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseOrderClient.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseOrderClient response = ResponseOrderClient();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }
}