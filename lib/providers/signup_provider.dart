import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../controllers/signup_controller.dart';


class SignupProvider extends ChangeNotifier{

  final SignupController _signupController = SignupController();

  String _gender="" , _age ="", _salary ="";


  DateTime currentDate = DateTime.now();
  TextEditingController dateinput = TextEditingController();

  //Personal
  //final _fullNameController = TextEditingController();
  //TextEditingController get fullNameController => _fullNameController;

  final _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  final _lastNameController = TextEditingController();
  TextEditingController get lastNameController => _lastNameController;

  final _nicController = TextEditingController();
  TextEditingController get nicController => _nicController;

  final _birthController = TextEditingController();
  TextEditingController get birthController => _birthController;

  final _localAddressController = TextEditingController();
  TextEditingController get localAddressController => _localAddressController;

  final _emergencyContactController = TextEditingController();
  TextEditingController get emergencyContactController => _emergencyContactController;

  String get gender => _gender;
  String get age => _age;
  String get salary => _salary;

  //Migration
  final _passportController = TextEditingController();
  TextEditingController get passportController => _passportController;

  final _currentAddressController = TextEditingController();
  TextEditingController get currentAddressController => _currentAddressController;

  //final _contactController = TextEditingController();
  //TextEditingController get contactController => _contactController;

  //Employment
  final _employeeAddressController = TextEditingController();
  TextEditingController get employeeAddressController => _employeeAddressController;

  final _empContactController = TextEditingController();
  TextEditingController get empContactController => _empContactController;



  //Contact Person

  final _slPersonController = TextEditingController();
  TextEditingController get slPersonController => _slPersonController;

  final _uaePersonController = TextEditingController();
  TextEditingController get uaePersonController => _uaePersonController;

  final _slPersonContactController = TextEditingController();
  TextEditingController get slPersonContactController => _slPersonContactController;

  final _uaePersonContactController = TextEditingController();
  TextEditingController get uaePersonContactController => _uaePersonContactController;

  final _passwdController = TextEditingController();
  TextEditingController get passwdController => _passwdController;


  void setGender(String value){
    _gender=value;
    notifyListeners();
  }

  void setBirth(String value){
    _birthController.text=value;
    notifyListeners();
  }

  void setAge(String value){
    _age=value;
    notifyListeners();
  }

  void setSalary(String value){
    _salary=value;
    notifyListeners();
  }



  Future<void> submitData(BuildContext context) async {
    //print(_fullNameController.text);

    await _signupController.signupRequest(
        "",_firstNameController.text,_lastNameController.text,
        _nicController.text,gender, _birthController.text,"",_localAddressController.text,
        _emergencyContactController.text,_passportController.text,_currentAddressController.text,
        "",_employeeAddressController.text,_empContactController.text,
        salary,_slPersonController.text,_slPersonContactController.text,_uaePersonController.text,
        _uaePersonContactController.text,_passwdController.text)
        .then(
            (value) async{context.loaderOverlay.hide();
        Logger().d(value.message);

        if(value.result == 1 ){
          clear();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'User Account Created Successfully!',
              confirmBtnText: 'Ok',
              onConfirmBtnTap: (){
                Navigator.pushNamed(context, '/login');
              }

          );
        }else{
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'User Account Create failed!${value.message}',
          );
        }


        }

    );
  }

  void clear(){

    //_fullNameController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _nicController.clear();
    setGender("");
    _birthController.clear();
    //setAge("");
    _localAddressController.clear();
    _emergencyContactController.clear();
    _passportController.clear();
    _currentAddressController.clear();
   // _contactController.clear();
    _employeeAddressController.clear();
    _empContactController.clear();
    setSalary("");
    _slPersonController.clear();
    _slPersonContactController.clear();
    _uaePersonController.clear();
    _uaePersonContactController.clear();
    _passwdController.clear();
  }

}

class DropdwnItem {
  final String value;

  DropdwnItem(this.value);
}