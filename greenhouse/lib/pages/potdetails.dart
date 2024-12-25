import 'package:flutter/material.dart';
import 'package:greenhouse/pages/watering.dart';
import 'package:greenhouse/widgets/lamp.dart';
import 'package:greenhouse/widgets/temp.dart';

class PotDetails extends StatelessWidget {
  const PotDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pot1',
          style: TextStyle(color: Color(0xFFFFFFFF)), // Correct color for the text
        ),
        backgroundColor: const Color(0xFF011F31),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Customize icon color
        ),
      ),
      body: Container(
        color: const Color(0xFf00273F), // Set the background color for the whole body
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 150.0), // Set the right padding (adjust as needed)
                child: const Text(
                  'Controllers',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), // Dark color for text
                    fontSize: 40,
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              const Row(
                children: [
                  Lamp(),
                  Lamp(),
                ],
              ),
              const Temp(),
              const Watering(), // Correct usage of Temp widget
            ],
          ),
        ),
      ),
    );
  }
}
