import 'package:flutter/material.dart';

class LabourService extends StatefulWidget {
  const LabourService({super.key});

  @override
  State<LabourService> createState() => _LabourServiceState();
}

class _LabourServiceState extends State<LabourService> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Labour Services"),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
