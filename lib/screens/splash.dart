import 'package:flutter/material.dart';

import '../widgets/layer_one.dart';
import '../widgets/layer_three.dart';
import '../widgets/layer_two_splash.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
              Positioned(top: 130, right: 0,left: 20, bottom: 108, child: LayerTwoSplash()),
              Positioned(top: 160, right: 0, left: 20,bottom: 128, child: LayerThree()),
            ],
          ),
        ),
      ),
    );
  }
}