import 'package:flutter/material.dart';

class Watering extends StatefulWidget {
  const Watering({super.key, required Null Function(dynamic value) onWateringChanged});

  @override
  _WateringState createState() => _WateringState();
}

class _WateringState extends State<Watering> {
  bool isWateringOn = false; // Initial state of the watering system

  // Toggle the watering system on/off
  void toggleWatering() {
    setState(() {
      isWateringOn = !isWateringOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 22, 36),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Text: "Watering"
          const Text(
            'Watering',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16), // Added space between title and status

          // Status Text (Turned ON / OFF) & Light
          Row(
            children: [
              // Status text
              Text(
                isWateringOn ? 'Turned ON' : 'Turned OFF',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isWateringOn ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(width: 10),
              
              // Circular indicator (Green/Red light)
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isWateringOn ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Space before the button

          // Toggle Button
          Container(
            child: GestureDetector(
              onTap: toggleWatering,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isWateringOn
                        ? [Colors.green.shade400, Colors.green.shade700]
                        : [Colors.red.shade400, Colors.red.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isWateringOn
                          ? Colors.green.withOpacity(0.4)
                          : Colors.red.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isWateringOn ? Icons.water_drop : Icons.watch_off,
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isWateringOn ? 'TURN OFF' : 'TURN ON',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
