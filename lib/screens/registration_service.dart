import 'package:flutter/material.dart';

class RegistrationService extends StatefulWidget {
  const RegistrationService({super.key});

  @override
  State<RegistrationService> createState() => _RegistrationServiceState();
}

class _RegistrationServiceState extends State<RegistrationService> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Registration Services"),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
