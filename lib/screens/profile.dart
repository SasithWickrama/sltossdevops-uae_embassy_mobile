import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../providers/general_provider.dart';
import '../providers/signin_provider.dart';
import '../widgets/profile_column.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GeneralProvider>(context, listen: false).loadData(context)
          .then((value) {
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    final generalProvider = Provider.of<GeneralProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgimage.jpg'),
                fit: BoxFit.cover,
                opacity: 0.5,
              )),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),

                      ]
                  ),
                  width: width * 0.95,
                  height: height *0.95,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                          width: 80,
                          height: 80,
                          decoration:  BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/prof.jpg'),
                          ),
                        )),
                        Text("${generalProvider.userLoad.firstName} ${generalProvider.userLoad.lastName}",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
                        Divider(),
                        SizedBox(height: 25,),
                         Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Peronal Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w700,fontSize: 18)),
                                    IconButton(
                                        icon: Icon(Icons.delete,color: Colors.red,),
                                        iconSize: 25,
                                        onPressed: (){
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext ctx) {
                                                return AlertDialog(
                                                  title: const Text('Are you sure you want to delete?'),
                                                  actions: [
                                                    MaterialButton(
                                                      color: Colors.red,
                                                      textColor: Colors.white,
                                                      child: const Text('CANCEL'),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        setState(() {
                                                        });
                                                      },
                                                    ),
                                                    MaterialButton(
                                                      color: Colors.green,
                                                      textColor: Colors.white,
                                                      child: const Text('DELETE'),
                                                      onPressed: () {
                                                        context.loaderOverlay.show();
                                                        Navigator.of(context).pop();
                                                        Provider.of<GeneralProvider>(context, listen: false).deleteUser(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });

                                        },
                                        )
                                  ],
                                ),
                              ),
                              Divider(thickness: 2,),
                              SizedBox(height: 25,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    ProfileColumnWidget(labeltext: "First Name",valuetext: generalProvider.userLoad.firstName.toString(),icon: Icons.person_outlined,),
                                    ProfileColumnWidget(labeltext: "Last Name",valuetext: generalProvider.userLoad.lastName.toString(),icon: Icons.person_outlined,),
                                    ProfileColumnWidget(labeltext: "NIC",valuetext: generalProvider.userLoad.nic.toString(),icon: Icons.book_online_sharp,),
                                    ProfileColumnWidget(labeltext: "Gender",valuetext: generalProvider.userLoad.gender.toString(),icon: Icons.account_circle_rounded,),
                                    ProfileColumnWidget(labeltext: "Date of Birth",valuetext: generalProvider.userLoad.dateOfBirth.toString(),icon: Icons.calendar_today,),
                                    //ProfileColumnWidget(labeltext: "Age",valuetext: generalProvider.userLoad.age.toString(),icon: Icons.date_range,),
                                    ProfileColumnWidget(labeltext: "Sri Lankan Address",valuetext: generalProvider.userLoad.slAddress.toString(),icon: Icons.home,),

                                  ],
                                ),
                              ),

                              SizedBox(height: 25,),
                              Text("Migration Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
                              Divider(thickness: 2,),
                              SizedBox(height: 25,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    ProfileColumnWidget(labeltext: "Passport Number",valuetext: generalProvider.userLoad.passportNo.toString(),icon: Icons.book_online_sharp,),
                                    ProfileColumnWidget(labeltext: "Current Address",valuetext: generalProvider.userLoad.uaeAddress.toString(),icon: Icons.home,),
                                    //ProfileColumnWidget(labeltext: "UAE Mobile Number",valuetext: generalProvider.userLoad.uaeMobileNo.toString(),icon: Icons.mobile_friendly,),
                                  ],
                                ),
                              ),

                              SizedBox(height: 25,),
                              Text("Employment Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
                              Divider(thickness: 2,),
                              SizedBox(height: 25,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    ProfileColumnWidget(labeltext: "Employer Address",valuetext: generalProvider.userLoad.empAddress.toString(),icon: Icons.business_sharp,),
                                    ProfileColumnWidget(labeltext: "Employer Contact Number",valuetext: generalProvider.userLoad.empAddress.toString(),icon: Icons.phone,),
                                    ProfileColumnWidget(labeltext: "Salary Category",valuetext: generalProvider.userLoad.salary.toString(),icon: Icons.attach_money,),
                                  ],
                                ),
                              ),

                              SizedBox(height: 25,),
                              Text("Contact Person Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 18)),
                              Divider(thickness: 2,),
                              SizedBox(height: 10,),
                              Text("Sri Lanka",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 16)),
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    ProfileColumnWidget(labeltext: "Name",valuetext: generalProvider.userLoad.slContactName.toString(),icon: Icons.person,),
                                    ProfileColumnWidget(labeltext: "Contact Number",valuetext: generalProvider.userLoad.slContactNo.toString(),icon: Icons.phone,),
                                    ],
                                ),
                              ),

                              SizedBox(height: 10,),
                              Text("UAE",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800,fontSize: 16)),
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    ProfileColumnWidget(labeltext: "Name",valuetext: generalProvider.userLoad.uaeContactName.toString(),icon: Icons.person,),
                                    ProfileColumnWidget(labeltext: "Contact Number",valuetext: generalProvider.userLoad.uaeContactNo.toString(),icon: Icons.phone,),
                                    ],
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
