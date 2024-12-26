import 'package:flutter/material.dart';

class plantinfo extends StatefulWidget {
  const plantinfo({super.key});

  @override
  _LampState createState() => _LampState();
}

class _LampState extends State<plantinfo> {
  double speed = 40.0; // Initial speed value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 4, 211, 125), // Set background color
        borderRadius: BorderRadius.circular(50), // Apply border radius for rounded corners
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF001426), 
            blurRadius: 10, 
            spreadRadius: 2,
          ),
        ], // Apply shadow
      ),
      child: Container(),
    );
  }
}
