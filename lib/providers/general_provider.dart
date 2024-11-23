
import 'package:flutter/material.dart';
import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../controllers/login_controller.dart';
import '../models/shared_pref.dart';
import '../models/user.dart';

class GeneralProvider extends ChangeNotifier {

  final LoginController _loginController = LoginController();

  List myBookings =[];
  //User userDetils = User();
  //User get users => userDetils;

  User userLoad = User();
  User get users => userLoad;



  Future<void> loadData(BuildContext context) async {
    SharedPref prefs = await  SharedPref();
    User user = User.fromJson(await prefs.read("userDetails"));
    userLoad = user;
    Logger().d(user);
    Logger().d(userLoad);
  }

  Future<void> getMyBookings() async {
    SharedPref prefs = await  SharedPref();
    User user = User.fromJson(await prefs.read("userDetails"));
    userLoad = user;
    await _loginController.getMyBookings(userLoad.passportNo.toString(),await prefs.readvalue("token")).then(
            (value) async {
          myBookings = value.data;
        }
    );
  }

  Future<void> deleteUser(BuildContext context) async {
    SharedPref prefs = await  SharedPref();
    User user = User.fromJson(await prefs.read("userDetails"));
    userLoad = user;
    await _loginController.userDelete(userLoad.passportNo.toString(),await prefs.readvalue("token")).then(
            (value) async {
          Provider.of<SigninProvider>(context,listen: false).clear();
          Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
        }
    );
  }


}