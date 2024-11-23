import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:intl/intl.dart';
import '../controllers/login_controller.dart';
import '../models/shared_pref.dart';

class SigninProvider extends ChangeNotifier{

  final LoginController _loginController = LoginController();

  final _passportController = TextEditingController();
  TextEditingController get passportController => _passportController;

  final _passwdController = TextEditingController();
  TextEditingController get passwdController => _passwdController;

  List _tSlot =[];


  get tSlot => _tSlot ;


  List  _timeSlot=[];
  get timeSlot => _timeSlot;

  void setSlot(){

  }


  Future<void> login(BuildContext context) async {

    String a ;
    var date, secondDate, interval;

    await _loginController.loginRequest(
        _passportController.text,_passwdController.text)
        .then(
            (value) async{
        Logger().d(value.message);
        context.loaderOverlay.hide();
        if(value.result == 1 ){

          SharedPref prefs = await SharedPref();
          prefs.savevalue("token", value.token.toString());
          prefs.save("userDetails", value.data);
          Navigator.pushNamed(context, '/dashboard');

          await _loginController.getInitialData("UAE",value.token.toString()).then(
                  (value) async {
                Logger().d("111");
                Logger().d(value.data);
                if (value.data[0]['service_name'] == 'CONSULAR') {
                  a = value.data[0]['start_time'];
                  date = DateTime.parse("2020-09-27 $a");
                  secondDate = (date.add(
                      Duration(hours: int.parse(value.data[0]['duration']))));
                  interval =
                      Duration(minutes: int.parse(value.data[0]['t_interval']));

                  _tSlot.add(DateFormat('HH:mm').format(date));
                  _timeSlot.add(DateFormat('HH:mm a').format(date));

                  while (date.millisecondsSinceEpoch <
                      secondDate.millisecondsSinceEpoch) {
                    date = date.add(interval);
                    _tSlot.add(DateFormat('HH:mm').format(date));
                    _timeSlot.add(DateFormat('HH:mm a').format(date));
                  }
                }

              }
          );





        }else{
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: value.message.toString(),
          );
        }


        }

    );




  }

  Future<void> fogotPasswd(BuildContext context) async {

    await _loginController.fogotPasswd(
        _passportController.text,_passwdController.text)
        .then(
            (value) async{context.loaderOverlay.hide();
        Logger().d(value.message);

        if(value.result == 1 ){
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Password Changed Successfully!',
              confirmBtnText: 'Ok',
              onConfirmBtnTap: (){
                Navigator.pushNamed(context, '/login');
              }

          );

        }else{
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: value.message.toString(),
          );
        }


        }

    );
  }

  void clear(){
    _passportController.clear();
    _passwdController.clear();
    _tSlot= [];
    _timeSlot=[];
    notifyListeners();
  }


  Future<void> userDelete(BuildContext context,String passportNo) async {

    context.loaderOverlay.hide();
    Logger().d(passportNo);

  }
}