
import 'dart:convert';
import 'dart:math';
import 'package:logger/logger.dart';
import '../models/general_response.dart';
import '../models/shared_pref.dart';
import '../services/api_services.dart';
import 'package:intl/intl.dart';

class AppointmentController {

  Future<GenaralResponse> getBookedData(String bdate,String servcat) async {
    String serviceCat;
    SharedPref prefs =  await SharedPref();

    servcat.split('-')[0] == 'C' ? serviceCat = 'CONSULAR' :
    servcat.split('-')[0] == 'B' ? serviceCat = 'BUREAU' : serviceCat = "";

    var requestbody = jsonEncode(<String, String>{
      'bdate': bdate,
      'serviceCat': serviceCat,
    });

    Logger().i(requestbody);
    return await ApiServices().sendRequestToken("services","getBooked", requestbody,await prefs.readvalue("token"));

  }

  Future<GenaralResponse> submitRequest(String adate,String atime,String serv,String user) async {
    String serviceCat;
    SharedPref prefs =  await SharedPref();
    var rng = DateFormat('yyyyMMddHHmmss').format(DateTime.now())+user;
    String ref = "";

    serv.split('-')[0] == 'C' ? serviceCat = 'CONSULAR' :
    serv.split('-')[0] == 'B' ? serviceCat = 'BUREAU' : serviceCat = "";

    serv.split('-')[1] == 'PASSPORT' ? ref = "P$rng":
    serv.split('-')[1] == 'VISA' ? ref = "V$rng":
    serv.split('-')[1] == 'BIRTH REGISTRATION' ? ref = "B$rng":
    serv.split('-')[1] == 'MARRIAGE REGISTRATION' ? ref = "M$rng":
    serv.split('-')[1] == 'DEATH REGISTRATION' ? ref = "D$rng":
    ref = "EW$rng";

    var requestbody = jsonEncode(<String, String>{
      'appointId': ref,
      'appointDate': adate,
      'appointTime': atime,
      'serviceCat': serviceCat,
      'serviceTyp': serv.split('-')[1],
      'appointuser': user,
      'appointStat': "0",
      'appointCount': "1",

    });

    Logger().i(requestbody);
    return await ApiServices().sendRequestToken("services","updateAppoint", requestbody,await prefs.readvalue("token"));

  }



}