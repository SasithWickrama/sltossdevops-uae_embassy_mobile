import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shared_pref.dart';
import '../models/user.dart';
import '../providers/general_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

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
    final generalProvider = Provider.of<GeneralProvider>(context,listen: false);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              accountName: Text(
                generalProvider.userLoad.fullName.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              accountEmail: const Text(""),//circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            onTap: () {
              Navigator.pushNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            onTap: () {
              Navigator.pushNamed(context,'/policyweb');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            onTap: () {
              Navigator.pushNamed(context,'/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
            onTap: () {
              Provider.of<SigninProvider>(context,listen: false).clear();
                Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}




