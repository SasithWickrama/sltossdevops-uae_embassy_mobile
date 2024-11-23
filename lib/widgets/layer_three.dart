import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'material_button.dart';



class LayerThree extends StatefulWidget {
  const LayerThree({Key? key}) : super(key: key);

  @override
  State<LayerThree> createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {

  @override
  Widget build(BuildContext context) {

    //final validationService = Provider.of<LoginProvider>(context);
    bool isChecked = false;
    String _buttonText = 'Sign In';


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.90,
      child:  Stack(
        children: <Widget>[
          Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  Text("Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 2.5,
              //   decoration: const BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/welcome.jpeg")
              //       )
              //   ),
              // ),

              Column(
                children: <Widget>[
                  SizedBox(height:120),
                  MaterialButtonWidget(color: Colors.lightBlue,text: "Sign in",bheight: 60,event: "login",),
                  SizedBox(height:20),
                  MaterialButtonWidget(color: Colors.lightBlue,text: "Sign up",bheight: 60,event: "register",),
                  SizedBox(height:20),
                ],
              ),

            ],
          ),


        ],
      ),
    );
  }
}

