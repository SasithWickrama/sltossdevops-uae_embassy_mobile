import 'dart:convert';
import 'dart:io';

import 'package:lanka_konect_uae/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import '../models/general_response.dart';
import '../utils/constant/asset_constant.dart';

class ApiServices {


  Future<GenaralResponse> sendRequest(String catagory, String function, var requestbody) async {

    Uri url = Uri.parse('${AssetConstants.baseUrl}${catagory}/${function}');
    GenaralResponse generalResponse;
    Logger().i(requestbody);
    var header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};
    if(await checkConnectivity()) {
      try {
          final response = await http.post(url, headers: header, body: requestbody);
          final data = json.decode(response.body);
          Logger().i(data);
          generalResponse = GenaralResponse.fromJson(data);
      }catch (e) {
        generalResponse = GenaralResponse(
            result: 0, message: 'API Error');
      }
    }else{
      generalResponse = GenaralResponse(
          result: 0, message: 'No Internet Connection');
    }
    return generalResponse;
  }

  Future<LoginResponse> loginRequest(String catagory, String function, var requestbody) async {

    Uri url = Uri.parse('${AssetConstants.baseUrl}${catagory}/${function}');
    LoginResponse loginResponse;
    Logger().i(url);
    Logger().i(requestbody);
    var header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};
    if(await checkConnectivity()) {
      try {
        final response = await http.post(
            url, headers: header, body: requestbody);
        final data = json.decode(response.body);
        Logger().i(data);
        loginResponse = LoginResponse.fromJson(data);
      } catch (e) {
        Logger().i(e);
        loginResponse = LoginResponse(
            result: 0, message: 'API Error');
      }
    }else{
      loginResponse = LoginResponse(
          result: 0, message: 'No Internet Connection');
    }
    return loginResponse;
  }

  Future<GenaralResponse> sendRequestToken(String catagory, String function, var requestbody,String token) async {

    Uri url = Uri.parse('${AssetConstants.baseUrl}${catagory}/${function}');
    GenaralResponse generalResponse;
    Logger().i(requestbody);
    var header = <String, String>{'Content-Type': 'application/json; charset=UTF-8','Authorization': 'Bearer $token',};
    if(await checkConnectivity()) {
      try {
        final response = await http.post(url, headers: header, body: requestbody);
        final data = json.decode(response.body);
        Logger().i(data);
        generalResponse = GenaralResponse.fromJson(data);
      }catch (e) {
        generalResponse = GenaralResponse(
            result: 0, message: 'API Error ');
      }
    }else{
      generalResponse = GenaralResponse(
          result: 0, message: 'No Internet Connection');
    }
    return generalResponse;
  }

  Future<bool> checkConnectivity() async {
    final bool _intResult =  await InternetConnectionChecker().hasConnection ;
    return _intResult;
  }
}

