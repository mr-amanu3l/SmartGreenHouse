import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(color: Color(0xFF00FF8C)),
        ),
        backgroundColor: const Color(0xFF011F31),
        elevation: 4, // Use a lower value for a subtle shadow
        automaticallyImplyLeading: true, // Disable back button
        toolbarHeight: 70,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255), // Set the icon color (white in this case)
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dashboard Content',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
