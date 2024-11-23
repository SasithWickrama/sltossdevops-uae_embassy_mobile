import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ProfileColumnWidget extends StatelessWidget {
  const ProfileColumnWidget({
    Key? key,
    required this.labeltext,
    required this.valuetext,
    required this.icon,
  }) : super(key: key);

    final String labeltext;
    final String valuetext;
    final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,color: Colors.cyan,),
            SizedBox(width: 15,),
            Text(labeltext,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 40,),
            Text(valuetext,style: TextStyle(color:Colors.grey,fontSize: 17,fontWeight: FontWeight.w500),),
          ],
        ),
        Divider(),
      ],
    );
  }
}
