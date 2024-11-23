
import 'dart:convert';

import 'package:lanka_konect_uae/models/login_response.dart';
import 'package:logger/logger.dart';
import '../models/general_response.dart';
import '../models/shared_pref.dart';
import '../services/api_services.dart';

class LoginController {

  Future<GenaralResponse> getInitialData(String embassy,String token) async {

    var requestbody = jsonEncode(<String, String>{
      'embassyName': embassy,
    });

    Logger().i(requestbody);
    return await ApiServices().sendRequestToken("services","getService", requestbody,token);

  }

  Future<LoginResponse> loginRequest(String passport,String passwd) async {

    var requestbody = jsonEncode(<String, String>{
      'passportNo': passport,
      'passCode': passwd,
    });

    Logger().i(requestbody);
    return await ApiServices().loginRequest("users","login", requestbody);

  }

  Future<GenaralResponse> fogotPasswd(String passport,String passwd) async {

    var requestbody = jsonEncode(<String, String>{
      'passportNo': passport,
      'passCode': passwd,
    });

    Logger().i(requestbody);
    return await ApiServices().sendRequest("users","changepasswd", requestbody);

  }

  Future<GenaralResponse> getMyBookings(String passportNo,String token) async {

    var requestbody = jsonEncode(<String, String>{
      'passportNo': passportNo,
    });

    Logger().i(requestbody);
    return await ApiServices().sendRequestToken("services","getMyBooking", requestbody,token);

  }

  Future<GenaralResponse> userDelete(String passportNo,String token) async {

    var requestbody = jsonEncode(<String, String>{
      'passportNo': passportNo,
    });

    Logger().i(requestbody);
    return await ApiServices().sendRequestToken("users","delete", requestbody,token);

  }
}