import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';


import '../providers/appointment_provider.dart';
import '../widgets/drawer_widget.dart';

class AppointmentService extends StatefulWidget {

  const AppointmentService({super.key});
  @override
  State<AppointmentService> createState() => _AppointmentServiceState();
}

class _AppointmentServiceState extends State<AppointmentService> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<AppointmentProvider>(context, listen: false).loadData(context,"")
          .then((value) {
        setState(() {
          Provider.of<AppointmentProvider>(context, listen: false).selectedDay = DateTime.now();
        });
      });

    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;
    final appointmentProvider = Provider.of<AppointmentProvider>(context,listen: false);
    final loginProvider = Provider.of<SigninProvider>(context,listen: false);
    Size size = MediaQuery.of(context).size;
    var firstDay = DateTime.now();

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 40.0,
                    pinned: true,
                    backgroundColor: Colors.lightBlue,
                    flexibleSpace: const FlexibleSpaceBar(
                      title: Text('Appointment',style: TextStyle(color: Colors.black),),

                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]
                )
              ];
            },
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bgimage.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  )),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                              hintText: 'SERIVICE',
                              labelText: 'SERIVICE',
                              prefixIcon:  Icon(
                                Icons.design_services, color: Colors.lightBlue,),
                              errorStyle: TextStyle(fontSize: 14.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                          items: appointmentProvider.serviceItems
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item, style: const TextStyle(fontSize: 16,),),
                              ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Service.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            Provider.of<AppointmentProvider>(context,listen: false).setService(value.toString());
                              Provider.of<AppointmentProvider>(context, listen: false).loadData(context,value.toString())
                                  .then((value) {
                                    setState(() {
                                      Provider.of<AppointmentProvider>(context, listen: false).selectedDay = DateTime.now();
                                    });

                              });

                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down, color: Colors.black45,),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),),
                        ),
                        const SizedBox(height: 10,),
                        const Divider(
                          height: 5,
                          color: Colors.green,
                          thickness: 1,
                          indent : 5,
                          endIndent : 10,
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: size.width,
                          child: TableCalendar(
                            availableGestures: AvailableGestures.none,
                            firstDay: DateTime.utc(firstDay.year, firstDay.month, firstDay.day),
                            lastDay: DateTime.utc(2030, 3, 14),
                            currentDay: appointmentProvider.focusedDay,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            focusedDay: appointmentProvider.focusedDay,
                            calendarFormat: CalendarFormat.twoWeeks,
                            selectedDayPredicate: (day) {
                              print(appointmentProvider.focusedDay);
                              return isSameDay(
                                  appointmentProvider.selectedDay, day);
                              // appointmentProvider.loadSelectedData(context);
                            },
                            onDaySelected: (selectedDay, focusedDay) async{
                              if (!isSameDay(
                                  appointmentProvider.selectedDay, selectedDay)) {
                                // Call `setState()` when updating the selected day
                                await appointmentProvider.getBooked(context,selectedDay,appointmentProvider.service);
                                setState(() {
                                  appointmentProvider.focusedDay = selectedDay;
                                  Logger().d(appointmentProvider.bookedList);
                                  //appointmentProvider.loadSelectedData(context);
                                });
                              }
                            },
                            calendarStyle: const CalendarStyle(
                                todayTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white)),
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonDecoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              formatButtonTextStyle: const TextStyle(color: Colors
                                  .white),
                              formatButtonShowsNext: false,
                            ),
                            calendarBuilders: CalendarBuilders(
                              selectedBuilder: (context, date, events) =>
                                  Container(
                                      margin: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              10.0)),
                                      child: Text(
                                        date.day.toString(),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )),
                              todayBuilder: (context, date, events) =>
                                  Container(
                                      margin: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(
                                              10.0)),
                                      child: Text(
                                        date.day.toString(),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )),
                            ),

                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle
                                    )
                                ),
                                SizedBox(width: 10,),
                                Text("Available"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.circle
                                    )
                                ),
                                SizedBox(width: 10,),
                                Text("Selected"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle
                                    )
                                ),
                                SizedBox(width: 10,),
                                Text("Booked"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Divider(
                          height: 5,
                          color: Colors.green,
                          thickness: 1,
                          indent : 5,
                          endIndent : 10,
                        ),
                        SizedBox(height: 10,),
                        GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 1,
                              childAspectRatio: 1 / 0.55,
                              mainAxisSpacing: 4,
                              crossAxisCount: 4,),
                            itemCount: loginProvider.tSlot.length,
                            itemBuilder: (BuildContext context, int index) {
                              bool checked = index ==
                                  appointmentProvider.checkedindex;
                              bool booked = false;
                              bool timePassed = false;
                              if (appointmentProvider.bookedList.contains(index)) {
                                booked = true;
                              }
                              if ( appointmentProvider.getTime(loginProvider.tSlot[index])) {
                                timePassed = true;
                              }
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!booked && !timePassed ) {
                                      appointmentProvider.checkedindex = index;
                                    }
                                  });
                                },
                                child: Container(
                                    width: size.width * 0.2,
                                    height: 50,
                                    margin: const EdgeInsets.all(4.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: timePassed
                                            ? Colors.grey.shade600
                                            : booked ? Colors.red.shade400 : checked
                                            ? Colors.amber.shade400
                                            : appointmentProvider.containerColor,
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Text(
                                      loginProvider.timeSlot[index],
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
                                    )),
                              );
                            }),
                        SizedBox(height: 10,),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                                  setState(() {
                                    Provider.of<AppointmentProvider>(context, listen: false).submitAppoint(context);
                                    });
                            }else{
                              setState(() {

                              });
                            }
                          },
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          ),
                        ),
                  
                  
                  
                  
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
        drawer: DrawerWidget(),

      ),
    );
  }
}
