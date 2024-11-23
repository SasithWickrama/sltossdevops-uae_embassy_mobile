import 'package:lanka_konect_uae/providers/general_provider.dart';
import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:lanka_konect_uae/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GeneralProvider>(context, listen: false).getMyBookings().then((value) {
        context.loaderOverlay.show();
        setState(() {
          context.loaderOverlay.hide();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    GeneralProvider sign = Provider.of<GeneralProvider>(context, listen: false) ;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Appointments"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.90,
            child: ListView.builder(
                scrollDirection: Axis.vertical,

                shrinkWrap: true,
                itemCount: Provider.of<GeneralProvider>(context).myBookings.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      //color: Colors.teal[800],
                      //color: sign.myBookings[index]['appoint_stat']== "0" ? Colors.blue : Colors.red,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/bgimage.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.2,
                                ),
                              color: sign.myBookings[index]['appoint_stat']== "0" ? Colors.blue : Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration:  BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/icon/booking.png'),
                                      ),
                                    ),
                                  ),
                                ),

                                Text(sign.myBookings[index]['appoint_id'],style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const Divider(color: Colors.greenAccent, thickness: 2.5, height: 0,indent : 15,endIndent : 15,),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text("Service", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.purpleAccent),),
                                Text(sign.myBookings[index]['service_type'],
                                  style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black87,),),
                                SizedBox(height: 10,),
                                Text("Date & Time", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.purpleAccent),),
                                Row(
                                  children: [
                                    Text(sign.myBookings[index]['appoint_date'], style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black87),),
                                    SizedBox(width: 20,),
                                    Text(sign.myBookings[index]['appoint_time'], style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black87),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}
