import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ServiceCards extends StatelessWidget {
  const ServiceCards({
    required this.text,
    required this.color,
    required this.icon,
    required this.route,
    required this.width,
    required this.height,
    required this.arg,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final String icon;
  final String route;
  final double width;
  final double height;
  final String arg;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Logger().d(arg);
        Navigator.pushNamed(context, '/$route',arguments: arg);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: const DecorationImage(
              image: AssetImage('assets/images/bgimage.jpg'),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),

            ]
        ),
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                width: 45,
                height: 45,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(icon),
                  ),
                ),
              ),
            ),
            Text(text,style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 20, ),
            )
          ],
        ),
      ),
    );
  }
}