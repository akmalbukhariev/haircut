import 'dart:convert';

import 'package:haircut/data/models/http_response/response_hairdresser_info.dart';
import 'package:haircut/data/models/http_response/response_user_info.dart';
import 'package:haircut/data/models/user_info.dart';
import 'package:http/http.dart' as http;

import '../models/add_favorite_hairdresser_info.dart';
import '../models/hairdresser_booked_client_himself.dart';
import '../models/hairdresser_client_book.dart';
import '../models/http_response/response_add_favorite_hairdresser.dart';
import '../models/http_response/response_booked_list.dart';
import '../models/http_response/response_detail_hairdresser.dart';
import '../models/http_response/response_favorite_hairdresser.dart';
import '../models/http_response/response_hairdresser.dart';
import '../models/http_response/response_hairdresser_booked_clients.dart';
import '../models/http_response/response_hairdresser_service.dart';
import '../models/http_response/response_order_client.dart';
import '../models/http_response/response_register.dart';
import '../models/http_models/register_user.dart';
import '../models/user_booked_info.dart';

class HttpService{
   static String SERVER_URL = "http://localhost:8080/haircut/api/v1/";
   static String URL_USER_REGISTER = "${SERVER_URL}user/register";
   static String URL_HAIRDRESSER_REGISTER = "${SERVER_URL}hairdresser/register";
   static String URL_GET_USER = "${SERVER_URL}user/getUser/";
   static String URL_GET_HAIRDRESSER = "${SERVER_URL}hairdresser/getHairdresser/";
   static String URL_GET_HAIRDRESSER_SERVICES = "${SERVER_URL}hairdresser/getHairdresserServices/";
   static String URL_UPDATE_USER_INFO = "${SERVER_URL}user/updateUserInfo";
   static String URL_GET_ALL_HAIRDRESSER = "${SERVER_URL}hairdresser/getAllHairdresserForUserMainPage";
   static String URL_GET_DETAIL_HAIRDRESSER = "${SERVER_URL}hairdresser/getHairdresserDetailInfo/";
   static String URL_INSERT_BOOKED_CLIENT = "${SERVER_URL}hairdresser/insertBookedClient";
   static String URL_INSERT_HAIRDREESER_BOOKED_CLIENT = "${SERVER_URL}hairdresser/addHairdresserBookedClient";
   static String URL_UPDATE_USER_CUSTOMER = "${SERVER_URL}user/updateUserCustomer";
   static String URL_UPDATE_USER_HAIRDERSSER = "${SERVER_URL}user/updateUserHairdreser";
   static String URL_GET_USER_BOOKED_LIST = "${SERVER_URL}user/getUserBookedList/";
   static String URL_GET_HAIRDRESSER_BOOKED_LIST = "${SERVER_URL}hairdresser/getBookedClients/";
   static String URL_ADD_FAVORITE_HAIRDRESSER = "${SERVER_URL}user/addFavoriteHairdresser";
   static String URL_GET_FAVORITE_HAIRDRESSER_LIST = "${SERVER_URL}user/getAllFavoriteHairdresser/";

   static Future<ResponseRegister?> userRegister({required RegisterUser? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_USER_REGISTER),
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

   static Future<ResponseRegister?> hairdresserRegister({required RegisterUser? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_HAIRDRESSER_REGISTER),
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

   static Future<ResponseHairdresserInfo?> getHairdresserInfo({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_HAIRDRESSER$phone'));
         if(response.statusCode == 200) {
            return ResponseHairdresserInfo.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseHairdresserInfo response = ResponseHairdresserInfo();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseHairdresserService?> getHairdresserServices({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_HAIRDRESSER_SERVICES$phone'));
         if(response.statusCode == 200) {
            return ResponseHairdresserService.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseHairdresserService response = ResponseHairdresserService();
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

   static Future<ResponseOrderClient?> hairdresserBookClient({required HairdresserBookedClientHimSelf? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_INSERT_HAIRDREESER_BOOKED_CLIENT),
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

   static Future<ResponseBookedList?> getUserBookedList({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_USER_BOOKED_LIST$phone'));
         if(response.statusCode == 200) {
            return ResponseBookedList.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseBookedList response = ResponseBookedList();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseAddFavoriteHairdresser?> addFavoriteHairdresser({required AddFavoriteHairdresserInfo? data}) async {
      try{
         var response = await http.post(
             Uri.parse(URL_ADD_FAVORITE_HAIRDRESSER),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200){
            return ResponseAddFavoriteHairdresser.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseAddFavoriteHairdresser response = ResponseAddFavoriteHairdresser();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseFavoriteHairdresser?> getAllFavoriteHairdresser({required String phone}) async {
      try{
         var response = await http.get(Uri.parse('$URL_GET_FAVORITE_HAIRDRESSER_LIST$phone'));
         if(response.statusCode == 200) {
            return ResponseFavoriteHairdresser.fromJson(json.decode(response.body));
         }
      }
      catch(e){
         ResponseFavoriteHairdresser response = ResponseFavoriteHairdresser();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }

   static Future<ResponseUserInfo?> updateUserInfo({required UserInfo? data}) async {
      try{
         var response = await http.put(
             Uri.parse(URL_UPDATE_USER_INFO),
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

   static Future<ResponseHairdresserBookedClient?> getHairdresserBookedList({required HairdresserClientBookInfo? data}) async {
      try {
         var response = await http.post(
             Uri.parse(URL_GET_HAIRDRESSER_BOOKED_LIST),
             headers: {"Content-Type": "application/json"},
             body: json.encode(data?.toJson())
         );
         if (response.statusCode == 200) {
            return ResponseHairdresserBookedClient.fromJson(
                json.decode(response.body));
         }
      }
      catch (e) {
         ResponseHairdresserBookedClient response = ResponseHairdresserBookedClient();
         response.resultMsg = e.toString();
         return response;
      }
      return null;
   }
}