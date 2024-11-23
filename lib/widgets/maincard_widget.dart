import 'package:flutter/material.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    required this.text,
    required this.color,
    required this.icon,
    required this.route,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final String icon;
  final String route;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(route == 'birthregistration'){
          Navigator.pushNamed(context, '/webview',arguments: 'B');
        }else if(route == 'marriageregistration'){
          Navigator.pushNamed(context, '/webview',arguments: 'M');
        }else if(route == 'deathegistration'){
          Navigator.pushNamed(context, '/webview',arguments: 'D');
        }else if(route == 'employmentservice'){
          Navigator.pushNamed(context, '/webview',arguments: 'EMP');
        }else if(route == 'documentservice'){
          Navigator.pushNamed(context, '/webview',arguments: 'DOC');
        }else if(route == 'visaservice'){
          Navigator.pushNamed(context, '/webview',arguments: 'V');
        }else{
          Navigator.pushNamed(context, '/$route');
        }

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
        width: 175,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
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

            Text(text,style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}