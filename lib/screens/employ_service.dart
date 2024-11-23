import 'package:flutter/material.dart';

import '../widgets/servicecard_widget.dart';

class EmployService extends StatefulWidget {
  const EmployService({super.key});

  @override
  State<EmployService> createState() => _EmployServiceState();
}

class _EmployServiceState extends State<EmployService> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Employment Services"),
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
                          ServiceCards(text:'SLBFE Registration',color:Colors.white,icon: 'assets/icon/employe.png',route: 'webview',width: 300,height: 120,arg: 'EMP1',),
                          SizedBox(height: 40,),
                          ServiceCards(text:'Recruitment Agents /\nJob Orders',color:Colors.white,icon: 'assets/icon/employe.png',route: 'webview',width: 300,height: 120,arg: 'EMP2',),
                          SizedBox(height: 40,),
                          ServiceCards(text:'Domestic Workers \nPrivate Recruitments',color:Colors.white,icon: 'assets/icon/employe.png',route: 'webview',width: 300,height: 120,arg: 'EMP3',),
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
