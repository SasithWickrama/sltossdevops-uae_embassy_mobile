import 'package:lanka_konect_uae/providers/general_provider.dart';
import 'package:lanka_konect_uae/screens/message_web.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/drawer_widget.dart';
import 'home.dart';
import 'mybookings.dart';
import 'news_feed.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GeneralProvider>(context, listen: false).loadData(context)
          .then((value) {
      });
    });
  }

  int selectedpage =0;
  final _pageNo = [Home() , MessageWeb() , Bookings() , News(), Home()];

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    final generalProvider = Provider.of<GeneralProvider>(context,listen: false);

      data != null ? selectedpage = int.parse(data.toString()) : selectedpage =0 ;

    print("Data : "+data.toString()+" "+selectedpage.toString());

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false ,
        child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logoimage.png'),
                    fit: BoxFit.cover,
                  )),
              child: _pageNo[selectedpage],
            ),

          drawer: const DrawerWidget(),

          bottomNavigationBar: ConvexAppBar(
            height: 50,

            color: Colors.white,
            backgroundColor: Colors.lightBlue,
            items: const [
              TabItem(icon: Icons.home, title: 'Home',),
              TabItem(icon: Icons.feed, title: 'Message'),
              TabItem(icon: Icons.newspaper, title: 'Appointments'),
              TabItem(icon: Icons.call, title: 'Emergency'),
            ],
            initialActiveIndex: selectedpage,
            onTap: (int index){
              print(index);
              setState(() {
                Navigator.pushNamed(context, '/dashboard',arguments: index);
                index == 3 ? launchUrl(Uri(scheme: "tel", path: "0097509318538")) : selectedpage = index;
              });
            },
          ),
        ),
      ),
    );

  }
}


