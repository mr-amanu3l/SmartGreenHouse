import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({super.key, required double temperature, required Null Function(dynamic value) onFanSpeedChanged});

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  double temperature = 22.0; // Initial temperature in Celsius
  int fanSpeed = 1; // Fan speed (1 to 3)

  // Method to increase temperature
  void increaseTemperature() {
    setState(() {
      temperature += 1.0;
    });
  }

  // Method to decrease temperature
  void decreaseTemperature() {
    setState(() {
      temperature -= 1.0;
    });
  }

  // Method to increase fan speed (1 to 3)
  void increaseFanSpeed() {
    setState(() {
      if (fanSpeed < 10) fanSpeed++;
    });
  }

  // Method to decrease fan speed (1 to 3)
  void decreaseFanSpeed() {
    setState(() {
      if (fanSpeed > 1) fanSpeed--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Make the entire container scrollable
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 250,
        width: 400, // Allow width to expand to full screen width
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF001426),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7), blurRadius: 10, spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Column: Fan Speed Control
            Expanded(  // Allow this section to expand and prevent overflow
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Fan Speed:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    '$fanSpeed',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold,color: Color(0xFF34C559)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_downward,color: Color(0xFFFFFFFF)),
                        onPressed: decreaseFanSpeed,
                        iconSize: 36,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_upward, color: Colors.white),
                        onPressed: increaseFanSpeed,
                        iconSize: 36,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 50), // Spacer between the two sections
            // Right Column: Temperature Control
            Expanded(  // Allow this section to expand and prevent overflow
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${temperature.toStringAsFixed(1)} °C',
                    style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 255, 255, 255)),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
