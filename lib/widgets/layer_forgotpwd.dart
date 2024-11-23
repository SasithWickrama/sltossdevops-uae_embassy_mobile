import 'package:lanka_konect_uae/widgets/text_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../providers/signin_provider.dart';


class Forgotpwd extends StatefulWidget {
  const Forgotpwd({super.key});

  @override
  State<Forgotpwd> createState() => _ForgotpwdState();
}

class _ForgotpwdState extends State<Forgotpwd> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    String _buttonText = 'Reset';


    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("RESET PASSWORD",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w900,fontSize: 30),),
              const SizedBox(height: 30,),
              TextFormFieldWidget(errortext1: "Passport Number",errortext2: "", hinttext: "Passport Number",
                  labletext: "Passport Number",keyboardType: TextInputType.text,icon: Icons.person,
                  customController: Provider.of<SigninProvider>(context).passportController),
              const SizedBox(height: 20,),
              TextFormFieldWidget(errortext1: "New Password",errortext2: "", hinttext: "New Password",
                  labletext: "New Password",keyboardType: TextInputType.text,icon: Icons.person,isObscureText: true,
                  customController: Provider.of<SigninProvider>(context).passwdController),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    if (_formKey.currentState!.validate()) {
                      context.loaderOverlay.show();
                      Provider.of<SigninProvider>(context, listen: false).fogotPasswd(context);
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        _buttonText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 75,),
              Center(
                child: RichText(
                    text:  TextSpan(
                        text: 'Already have an account ?  ',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, '/login'),
                              text: 'Login', style: const TextStyle(
                              color: Colors.lightBlue, fontWeight: FontWeight.bold,fontSize: 16)),
                        ]
                    )),
              )


            ],
          ),
        ),
      ),
    );
  }
}
