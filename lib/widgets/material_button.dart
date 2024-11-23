import 'dart:ffi';

import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    required this.color,
    required this.text,
    required this.bheight,
    required this.event,
    Key? key,

  }) : super(key: key);

  final Color color;
  final String text;
  final double bheight;
  final String event;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: bheight,
      onPressed: (){
        event == "login" ? Navigator.pushNamed(context, '/login') : Navigator.pushNamed(context, '/signup');
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
      },
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
      ),
    );
  }
}
