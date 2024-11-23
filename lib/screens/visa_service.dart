import 'package:flutter/material.dart';

class VisaService extends StatefulWidget {
  const VisaService({super.key});

  @override
  State<VisaService> createState() => _VisaServiceState();
}

class _VisaServiceState extends State<VisaService> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("VISA Services"),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
