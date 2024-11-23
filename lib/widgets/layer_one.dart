import 'package:flutter/material.dart';


import '../utils/colors.dart';

class LayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Image.asset('assets/images/xyntra.png')),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Image.asset('assets/images/sltlogo.png'))
                ],
              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }
}
