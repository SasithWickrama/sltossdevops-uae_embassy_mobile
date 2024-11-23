
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../models/general_response.dart';
import '../services/api_services.dart';

class SignupController {
  Future<GenaralResponse> signupRequest(String fullName,String fName,String lName,String nic, String gender,
      String birth, String age, String localAddress, String eContact, String passport, String currentAddress,
      String mobileNo, String empAddress, String empContact, String salary, String slPName, String slPContact,
      String uaePName, String uaePContact, String passwd) async {

      var requestbody = jsonEncode(<String, String>{
        'fullName': fullName,
        'firstName': fName,
        'lastName': lName,
        'nic': nic,
        'gender': gender,
        'dateOfBirth': birth,
        'age': age,
        'slAddress': localAddress,
        'emergencyContact': eContact,
        'passportNo': passport,
        'uaeAddress': currentAddress,
        'uaeMobileNo': mobileNo,
        'empAddress': empAddress,
        'empContact': empContact,
        'salary': salary,
        'slContactName': slPName,
        'slContactNo': slPContact,
        'uaeContactName': uaePName,
        'uaeContactNo': uaePContact,
        'passCode': passwd,
      });

    Logger().i(requestbody);
    return await ApiServices().sendRequest("users","create", requestbody);

  }
}