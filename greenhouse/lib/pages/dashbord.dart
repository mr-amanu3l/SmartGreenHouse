import 'package:flutter/material.dart';

class Dashbord extends StatelessWidget {
  const Dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome',
      style: TextStyle(color: Color.fromARGB(255, 0, 255, 8)),)),
    );
  }
}