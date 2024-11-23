import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:lanka_konect_uae/widgets/text_formfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';


import '../providers/signup_provider.dart';
import 'date_form.dart';
import 'material_button.dart';



class LayerSignup extends StatefulWidget {
  const LayerSignup({Key? key}) : super(key: key);

  @override
  State<LayerSignup> createState() => _LayerSignupState();

}

class _LayerSignupState extends State<LayerSignup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //final validationService = Provider.of<LoginProvider>(context);
    bool isChecked = false;
    String _buttonText = 'Register';

    final List<String> genderItems = ["Male", "Female",];
    String? genderValue;

    final List<String> ageItems = ["18-30", "30-40", "40-50" , "Above 50"];
    String? ageValue;

    final List<String> salaryItems = ["A - Above AED 20,000", "B - AED 15,000 - AED 20,000", "C - AED 10,000 - AED 15,000" , "D - AED 5,000 - AED 10,000","E - Below AED 5000"];
    String? salaryValue;


    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("REGISTER",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w900,fontSize: 30),),
              const SizedBox(height: 30,),
              Text("Peronal Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
              Divider(),
              //Full Name
              // TextFormFieldWidgetValidate(errortext1: "Full Name",errortext2: "", hinttext: "Full Name",
              //   labletext: "Full Name",keyboardType: TextInputType.text,icon: Icons.person,
              // customController: Provider.of<SignupProvider>(context).fullNameController),
              // const SizedBox(height: 15,),
              //First Name
              TextFormFieldWidgetValidate(errortext1: "First Name",errortext2: "", hinttext: "First Name",
                  labletext: "First Name *",keyboardType: TextInputType.text,icon: Icons.person_outlined,
                  customController: Provider.of<SignupProvider>(context).firstNameController),
              const SizedBox(height: 15,),
              //Last Name
              TextFormFieldWidgetValidate(errortext1: "Last Name",errortext2: "", hinttext: "Last Name",
                  labletext: "Last Name *",keyboardType: TextInputType.text,icon: Icons.person_outlined,
                  customController: Provider.of<SignupProvider>(context).lastNameController),
              const SizedBox(height: 15,),
              //NIC Name
              TextFormFieldWidgetValidate(errortext1: "NIC",errortext2: "", hinttext: "NIC",
                  labletext: "NIC *",keyboardType: TextInputType.text,icon: Icons.book_online_sharp,
                  customController: Provider.of<SignupProvider>(context).nicController),
              const SizedBox(height: 15,),
              //Gender
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                    hintText: 'Gender',
                    labelText: 'Gender *',
                    prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.lightBlue,),
                    errorStyle: TextStyle(fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0)))),

                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14,),),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  Provider.of<SignupProvider>(context,listen: false).setGender(value.toString());
                },
                buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8),),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black45,),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16),),
              ),
              const SizedBox(height: 15,),
              //Date of Birth
              TextFormField(
                validator: RequiredValidator(errorText: "Date of Birth",),
                controller: Provider.of<SignupProvider>(context).birthController, //editing controller of this TextField
                decoration:  const InputDecoration(
                    hintText: "Date of Birth",
                    labelText: "Date of Birth *",
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.lightBlue,),
                    errorStyle: TextStyle(fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0)))),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(1950), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2999)
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      Provider.of<SignupProvider>(context,listen: false).setBirth(formattedDate); //set output date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
              ),
              // const SizedBox(height: 15,),
              // DropdownButtonFormField2<String>(
              //   isExpanded: true,
              //   decoration: const InputDecoration(
              //       hintText: 'Age',
              //       labelText: 'Age',
              //       prefixIcon: Icon(Icons.date_range, color: Colors.lightBlue,),
              //       errorStyle: TextStyle(fontSize: 14.0),
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.red),
              //           borderRadius:
              //           BorderRadius.all(Radius.circular(9.0)))),
              //
              //   items: ageItems
              //       .map((item) => DropdownMenuItem<String>(
              //     value: item,
              //     child: Text(item, style: const TextStyle(fontSize: 14,),),
              //   ))
              //       .toList(),
              //   onChanged: (value) {
              //     Provider.of<SignupProvider>(context, listen: false).setAge(value.toString());
              //   },
              //   buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8),),
              //   iconStyleData: const IconStyleData(
              //     icon: Icon(Icons.arrow_drop_down, color: Colors.black45,),
              //     iconSize: 24,
              //   ),
              //   dropdownStyleData: DropdownStyleData(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16),),
              // ),
              const SizedBox(height: 15,),
              //Sri Lanka Address
              TextFormFieldWidget(errortext1: "Address",errortext2: "", hinttext: "Address",
                  labletext: "Sri Lankan Address ",keyboardType: TextInputType.text,icon: Icons.home,
                  customController: Provider.of<SignupProvider>(context).localAddressController),
              const SizedBox(height: 15,),
              //Emegrency Contact
              TextFormFieldWidgetValidate(errortext1: "Emergeny Contact Number",errortext2: "", hinttext: "Emergeny Contact Number",
                  labletext: "Emergeny Contact Number *",keyboardType: TextInputType.phone,icon: Icons.phone,
                  customController: Provider.of<SignupProvider>(context).emergencyContactController),
              const SizedBox(height: 15,),
              //Password
              TextFormFieldWidgetValidate(errortext1: "Password",errortext2: "", hinttext: "Password",
                  labletext: "Password *",keyboardType: TextInputType.text,icon: Icons.lock,
                  customController: Provider.of<SignupProvider>(context).passwdController),
              const SizedBox(height: 25,),

              Text("Migration Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
              Divider(),
              //Passport number
              TextFormFieldWidgetValidate(errortext1: "Passport Number",errortext2: "", hinttext: "Passport Number",
                labletext: "Passport Number *",keyboardType: TextInputType.text,icon: Icons.book_online_sharp,
                customController: Provider.of<SignupProvider>(context).passportController,),
              const SizedBox(height: 15,),

              //UAE Address
              TextFormFieldWidgetValidate(errortext1: "Current Address",errortext2: "", hinttext: "Address",
                  labletext: "Current Address *",keyboardType: TextInputType.text,icon: Icons.home,
                  customController: Provider.of<SignupProvider>(context).currentAddressController),
              // const SizedBox(height: 15,),
              //
              // //Contact Number
              // TextFormFieldWidgetValidate(errortext1: "UAE Mobile Number",errortext2: "", hinttext: "UAE Mobile Number",
              //     labletext: "UAE Mobile Number *",keyboardType: TextInputType.phone,icon: Icons.phone,
              //     customController: Provider.of<SignupProvider>(context).contactController),
              const SizedBox(height: 25,),

              Text("Employment Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
              Divider(),

              //Employee Address
              TextFormFieldWidget(errortext1: "Employer Address",errortext2: "", hinttext: "Address",
                  labletext: "Employer Address ",keyboardType: TextInputType.text,icon: Icons.business_sharp,
                  customController: Provider.of<SignupProvider>(context).employeeAddressController),
              const SizedBox(height: 15,),

              //Employee Contact Number
              TextFormFieldWidget(errortext1: "Employer Contact Number",errortext2: "", hinttext: "Contact Number",
                  labletext: "Employer Contact Number ",keyboardType: TextInputType.phone,icon: Icons.phone,
                  customController: Provider.of<SignupProvider>(context).empContactController),
              const SizedBox(height: 15,),

              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                    hintText: 'Salary Category',
                    labelText: 'Salary Category',
                    prefixIcon: Icon(Icons.attach_money, color: Colors.lightBlue,),
                    errorStyle: TextStyle(fontSize: 14.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius:
                        BorderRadius.all(Radius.circular(9.0)))),

                items: salaryItems
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 14,),),
                ))
                    .toList(),
                onChanged: (value) {
                  Provider.of<SignupProvider>(context, listen: false).setSalary(value.toString());
                },
                buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8),),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black45,),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16),),
              ),
              const SizedBox(height: 15,),

              Text("Contact Person Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
              Divider(),
              Text("Sri Lanka",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 15)),
              TextFormFieldWidget(errortext1: "Name",errortext2: "", hinttext: "Name",
                  labletext: "Name",keyboardType: TextInputType.text,icon: Icons.person,
                  customController: Provider.of<SignupProvider>(context).slPersonController),
              const SizedBox(height: 15,),

              TextFormFieldWidget(errortext1: "Contact Number",errortext2: "", hinttext: "Contact Number",
                  labletext: "Contact Number ",keyboardType: TextInputType.phone,icon: Icons.phone,
                  customController: Provider.of<SignupProvider>(context).slPersonContactController),
              const SizedBox(height: 15,),

              Text("UAE",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 15)),
              TextFormFieldWidget(errortext1: "Name",errortext2: "", hinttext: "Name",
                  labletext: "Name",keyboardType: TextInputType.text,icon: Icons.person,
                  customController: Provider.of<SignupProvider>(context).uaePersonController),
              const SizedBox(height: 15,),

              TextFormFieldWidget(errortext1: "Contact Number",errortext2: "", hinttext: "Contact Number",
                  labletext: "Contact Number ",keyboardType: TextInputType.phone,icon: Icons.phone,
                  customController: Provider.of<SignupProvider>(context).uaePersonContactController),
              const SizedBox(height: 15,),


              // TextFormFieldWidget(errortext1: "Password",errortext2: "", hinttext: "Password",
              //   labletext: "Password",keyboardType: TextInputType.text,icon: Icons.lock,isObscureText: true,
              //     customController: Provider.of<SignupProvider>(context).passwdController),
              // const SizedBox(height: 50,),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    if (_formKey.currentState!.validate()) {
                      context.loaderOverlay.show();
                      Provider.of<SignupProvider>(context, listen: false).submitData(context);
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
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Center(
                child: RichText(
                    text:  TextSpan(
                        text: 'Already have an account ?  ',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, '/login'),
                              text: 'Login', style: TextStyle(
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