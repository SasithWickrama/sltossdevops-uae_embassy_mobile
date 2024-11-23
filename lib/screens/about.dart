import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  var aa = Platform.isIOS.toString();
  var bb = Platform.operatingSystem.toString();
  var cc = Platform.operatingSystemVersion.toString();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("About"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
               SizedBox(height: 30,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon/appicon.jpg'),
                          ),
                        ),
                      ),
                    ),

                    Text("LankaKonect ",style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
                    Text(" 1.0.0 ",style: const TextStyle(fontSize: 14),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
