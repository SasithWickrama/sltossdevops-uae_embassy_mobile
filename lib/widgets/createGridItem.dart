import 'package:flutter/material.dart';

class CreateGridItem extends StatelessWidget {
  const CreateGridItem({
    required this.text,
    required this.color,
    required this.position,
    required this.icondata,
    required this.route,

    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final double position;
  final String icondata;
  final String route;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
        side: BorderSide(color: Colors.white),
      ),
      child: InkWell(
        onTap: () {
          print(position);
          Navigator.pushNamed(context, '/$route');
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 140,
                height: 70,
                decoration:  BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(icondata),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 140,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                ),
                child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w700),)),
              )
            ],
          ),
        ),
      ),
    );




  }
}