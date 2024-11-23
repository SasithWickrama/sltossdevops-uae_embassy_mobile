import 'package:flutter/material.dart';

import '../widgets/layer_one.dart';
import '../widgets/layer_signup.dart';
import '../widgets/layer_two.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgimage.jpg'),
                fit: BoxFit.cover,
              )),
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logoimage.png'),
                          fit: BoxFit.fill,
                        )) ,
                  )),
              Positioned(top: 100, right: 0, bottom: 0, child: LayerOne()),
              Positioned(top: 130, right: 0,left: 20, bottom: 28, child: LayerTwo()),
              Positioned(top: 160, right: 0, left: 20,bottom: 48, child: LayerSignup()),
            ],
          ),
        ),
      ),
    );
  }
}
