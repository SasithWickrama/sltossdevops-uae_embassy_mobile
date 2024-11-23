import 'dart:io';

import 'package:lanka_konect_uae/providers/appointment_provider.dart';
import 'package:lanka_konect_uae/providers/general_provider.dart';
import 'package:lanka_konect_uae/providers/signin_provider.dart';
import 'package:lanka_konect_uae/providers/signup_provider.dart';
import 'package:lanka_konect_uae/screens/about.dart';
import 'package:lanka_konect_uae/screens/appointment_service.dart';
import 'package:lanka_konect_uae/screens/bureau_service.dart';
import 'package:lanka_konect_uae/screens/consular_service.dart';
import 'package:lanka_konect_uae/screens/dashboard.dart';
import 'package:lanka_konect_uae/screens/document.dart';
import 'package:lanka_konect_uae/screens/employ_service.dart';
import 'package:lanka_konect_uae/screens/forgot_passwd.dart';
import 'package:lanka_konect_uae/screens/labour_service.dart';
import 'package:lanka_konect_uae/screens/login.dart';
import 'package:lanka_konect_uae/screens/mybookings.dart';
import 'package:lanka_konect_uae/screens/passport_service.dart';
import 'package:lanka_konect_uae/screens/privacy_web.dart';
import 'package:lanka_konect_uae/screens/profile.dart';
import 'package:lanka_konect_uae/screens/registration_service.dart';
import 'package:lanka_konect_uae/screens/signup.dart';
import 'package:lanka_konect_uae/screens/splash.dart';
import 'package:lanka_konect_uae/screens/visa_service.dart';
import 'package:lanka_konect_uae/screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';


class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient( context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = PostHttpOverrides();
  initializeDateFormatting()
      .then((_) =>runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => SignupProvider()),
      ChangeNotifierProvider(create: (context) => SigninProvider()),
      ChangeNotifierProvider(create: (context) => AppointmentProvider()),
      ChangeNotifierProvider(create: (context) => GeneralProvider()),

    ],
    child: const MyApp(),
  )));


  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitCubeGrid(
          color: Colors.lightBlueAccent,
          size: 50.0,
        ),
      ),
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      duration: Duration(seconds: 1),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LankaKonect',
        initialRoute: '/',

        routes: {
          '/': (context) => const Splash(),
          '/login': (context) => const Login(),
          '/signup': (context) => const Signup(),
          '/foegotpwd': (context) => const Forgotpassword(),
          '/dashboard': (context) => const Dashboard(),
          '/visaservice': (context) => const VisaService(),
          '/passportservice': (context) => const PassportService(),
          '/registrationservice': (context) => const RegistrationService(),
          '/labourservice': (context) => const LabourService(),
          '/apointmentservice': (context) => const AppointmentService(),
          '/documentservice': (context) => const DocumentService(),
          '/consular': (context)=> const ConsularService(),
          '/bureau': (context)=> const BureauService(),
          '/webview': (context)=> const WebViewLoad(),
          '/profile': (context)=> const Profile(),
          '/bookings': (context)=> const Bookings(),
          '/empservice': (context)=> const EmployService(),
          '/about': (context)=> const About(),
          '/policyweb': (context)=> const PolicyWeb(),

        },

      ),
    );
  }


}
