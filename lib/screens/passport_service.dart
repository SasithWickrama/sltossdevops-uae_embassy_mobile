import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import '../widgets/servicecard_widget.dart';

class PassportService extends StatefulWidget {
  const PassportService({super.key});

  @override
  State<PassportService> createState() => _PassportServiceState();
}

class _PassportServiceState extends State<PassportService> {



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Passport Services"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgimage.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                )),
            child:  const Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                       Column(
                        children:  [
                          ServiceCards(text:'New Sri Lankan \nPassport',color:Colors.white,icon: 'assets/icon/passport.png',route: 'webview',width: 300,height: 120,arg: 'P1',),
                          SizedBox(height: 40,),
                          ServiceCards(text:'Amendments to \nSri Lankan Passports',color:Colors.white,icon: 'assets/icon/passport.png',route: 'webview',width: 300,height: 120,arg: 'P2',),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
