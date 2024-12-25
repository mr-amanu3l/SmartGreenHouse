import 'package:flutter/material.dart';

class Lamp extends StatefulWidget {
  const Lamp({super.key});

  @override
  _LampState createState() => _LampState();
}

class _LampState extends State<Lamp> {
  double speed = 50.0; // Initial speed value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF001426), // Set background color
        borderRadius: BorderRadius.circular(50), // Apply border radius for rounded corners
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF001426), 
            blurRadius: 10, 
            spreadRadius: 2,
          ),
        ], // Apply shadow
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Adjust Fan Speed', style: TextStyle(color: Colors.white)),
            Slider(
              value: speed,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  speed = value;
                });
                // Send speed value to backend
                // Example: sendSpeedCommand(speed);
              },
            ),
            Text('Speed: ${speed.toStringAsFixed(0)}%', style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
