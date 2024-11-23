import 'package:lanka_konect_uae/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../providers/signup_provider.dart';

class DateFormFieldWidget extends StatelessWidget {
   DateFormFieldWidget({
    Key? key,
    required this.errortext1,
    required this.hinttext,
    required this.labletext,

    //required this.customController,
  }) : super(key: key);

  final String errortext1;
  final String hinttext;
  final String labletext;

  //final TextEditingController customController;
  final SignupProvider signupprovider = SignupProvider();
  TextEditingController dateinput = TextEditingController();

   @override
   void initState() {
     dateinput.text = ""; //set the initial value of text field
   }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: dateinput, //editing controller of this TextField
      validator: MultiValidator([
        RequiredValidator(errorText: errortext1),
      ]),
      decoration:  InputDecoration(
          hintText: "Date of Birth",
          labelText: "Date of Birth",
          prefixIcon: Icon(Icons.calendar_today, color: Colors.lightBlue,),
          errorStyle: const TextStyle(fontSize: 18.0),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius:
              BorderRadius.all(Radius.circular(9.0)))),
      readOnly: true,  //set it true, so that user will not able to edit text
      onTap: () async {





      },
    );
  }
}