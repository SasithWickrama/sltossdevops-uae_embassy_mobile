import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../controllers/appointment_controller.dart';
import '../models/shared_pref.dart';
import '../models/user.dart';

class AppointmentProvider extends ChangeNotifier {

  final AppointmentController _appointmentController = AppointmentController();



  User userDetils = User();
  User get user => userDetils;

  GridView aa = GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 0.55,
        mainAxisSpacing: 4,
        crossAxisCount: 4,),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
      });


  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  Color containerColor = Colors.green.shade600;
  int checkedindex = -1;

  String _service="";

  final List<String> serviceItems = ["C-PASSPORT", "C-VISA", 'C-BIRTH REGISTRATION', 'C-MARRIAGE REGISTRATION', 'C-DEATH REGISTRATION',
  "B-New Employment Registration","B-Renewal Employment Registration","B-Recruitment Agents Registration","B-Recruitment Agents / Job Orders",
  "B-Recruitment agents Employment contacts\n (Employment visa)","B-Recruitment agents Employment contacts \n(Visit visa)",
  "B-Domestic Workers Private Recruitment \n(Non Refundable)","B-Visit visa interviews"];

  var bookedList = [];

  String get service => _service;

  bool getTime(slotTime){
    String t1 = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString();
    String t2 = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()+" "+slotTime;

    DateTime dt1 = DateTime.parse(t1);
    DateTime dt2 = DateTime.parse(t2);

    if(selectedDay == null ){
      if(dt2.isBefore(dt1)){
        return true;
      }else{
        return false;
      }
    }else{
      String dselected = DateFormat('yyyy-MM-dd').format(selectedDay!);
      String dfocused = DateFormat('yyyy-MM-dd').format(focusedDay) ;

      if(dselected == dfocused){
        if(dt2.isBefore(dt1)){
          return true;
        }else{
          return false;
        }
      }else{
        return false;
      }
    }

  }

  void setService(String value){
    _service =value;
  }


  Future<void> loadData(BuildContext context,String servcat) async {
    final loginProvider = Provider.of<SigninProvider>(context,listen: false);
    Size size = MediaQuery.of(context).size;

    await _appointmentController.getBookedData(DateFormat('yyyy-MM-dd').format(focusedDay),servcat).then(
            (value) async {
          Logger().d(value.data);
          bookedList =[];
          for (var a in value.data){
            bookedList.add(Provider.of<SigninProvider>(context,listen: false).tSlot.indexOf(a['appoint_time']));
          }
          Logger().d(bookedList);
        }
    );

    notifyListeners();
  }

  // Future<void> loadSelectedData(BuildContext context, DateTime selectedDay) async {
  //   Logger().d(DateFormat('yyyy-MM-dd').format(focusedDay));
  //   bookedList =[];
  //
  //   await getBooked(selectedDay).then(
  //       (value) async{
  //
  //       }
  //   );
  //   Logger().d(tSlot);
  // }

  Future<void> getBooked(BuildContext context,DateTime selectDay,serviceCat) async {
    checkedindex = -1;
    bookedList = [];
    await _appointmentController.getBookedData(DateFormat('yyyy-MM-dd').format(selectDay),serviceCat).then(
            (value) async {
          Logger().d(value.data);
          //Logger().d(tSlot);
          for (var a in value.data){
            //Logger().d(a['appoint_time']);
            //Logger().d(tSlot.indexOf(a['appoint_time']));
            bookedList.add(Provider.of<SigninProvider>(context,listen: false).tSlot.indexOf(a['appoint_time']));
          }
          //Logger().d(bookedList);
        }
    );
  }


  Future<void> submitAppoint(BuildContext context) async {

    SharedPref prefs =  await SharedPref();
    User user = User.fromJson(await prefs.read("userDetails"));
    userDetils = user;

    Logger().d(service);
    Logger().d(selectedDay);
    Logger().d(Provider.of<SigninProvider>(context,listen: false).tSlot.elementAt(checkedindex));
    Logger().d(userDetils.passportNo);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            scrollable: true,
            title:  const Text('BOOKING NOTES', style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800),),
            content:  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Divider(
                    height: 5,
                    color: Colors.green,
                    thickness: 1,
                    indent : 5,
                    endIndent : 10,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("SERVICE : ", style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                      Text(service, style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("DATE : ", style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                      Text(DateFormat('yyyy-MM-dd').format(focusedDay), style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("TIME : ", style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                      Text(Provider.of<SigninProvider>(context,listen: false).tSlot.elementAt(checkedindex).toString(), style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('CONFIRM'),
                onPressed: () async {
                  context.loaderOverlay.show();
                  await _appointmentController.submitRequest(DateFormat('yyyy-MM-dd').format(focusedDay),Provider.of<SigninProvider>(context,listen: false).tSlot.elementAt(checkedindex).toString(),
                      service,userDetils.passportNo.toString())
                      .then(
                          (value) async{context.loaderOverlay.hide();
                      Logger().d(value.message);

                      if(value.result == 1 ){
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Appointment Created Successfully!',
                            confirmBtnText: 'Ok',
                            onConfirmBtnTap: (){

                              bookedList =[];
                              checkedindex = -1;
                              focusedDay = DateTime.now();
                              Navigator.of(context)..pop()..pop()..pop();
                              Navigator.pushNamedAndRemoveUntil(context, '/dashboard',(r) => false,arguments: 2);
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

                },
              ),
            ],
          );
        });


  }


  void clear(){

    notifyListeners();
  }
}

class DropdwnItem {
  final String value;

  DropdwnItem(this.value);
}

