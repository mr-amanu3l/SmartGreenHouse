import 'package:flutter/material.dart';
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
      body: Temp(), // Correct usage of Temp widget
    );
  }
}
