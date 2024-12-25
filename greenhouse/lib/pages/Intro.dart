import 'package:flutter/material.dart';
import 'package:greenhouse/pages/dashbord.dart'; // Only import once

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack( // Use Stack instead of Column
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Ghouse.png"), 
                fit: BoxFit.cover, // Ensure the image covers the entire screen
              ),
            ),
            height: double.infinity, // Makes the image fill the screen
          ),

          // Background text (behind the car)
          const Positioned(
            top: 300, // Adjust the top position of the text
            left: 40, // Adjust the left position of the text
            child: Text(
              "SMART \nGREENHOUSE", // Your text
              style: TextStyle(
                fontSize: 50, // Adjust the font size
                color: Color(0xFF1EFF00), // Light text color
                fontWeight: FontWeight.bold,
                shadows: [
                  // Adding multiple shadows to create a stroke effect
                  Shadow(
                    color: Color.fromARGB(255, 255, 255, 255), // White color for stroke
                    offset: Offset(2, 2), // Shadow offset for top-left direction
                    blurRadius: 5, // Reduce blur for a more defined stroke
                  ),
                  Shadow(
                    color: Color.fromARGB(255, 255, 255, 255), // White color for stroke
                    offset: Offset(-2, 2), // Shadow offset for bottom-right direction
                    blurRadius: 5, // Reduce blur for a more defined stroke
                  ),
                  Shadow(
                    color: Color.fromARGB(255, 0, 0, 0), // White color for stroke
                    offset: Offset(2, -2), // Shadow offset for bottom-left direction
                    blurRadius: 5, // Reduce blur for a more defined stroke
                  ),
                  Shadow(
                    color: Color.fromARGB(255, 255, 255, 255), // White color for stroke
                    offset: Offset(-2, -2), // Shadow offset for top-right direction
                    blurRadius: 5, // Reduce blur for a more defined stroke
                  ),
                ],
              ),
            ),
          ),

          // Text description with styled text
          const Positioned(
            top: 470, // Adjust the position of the text
            left: 40, // Adjust the left position of the text
            right: 40, // Adjust the right position of the text
            child: Text(
              'This project is all about Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 17, 17, 17),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         
          // Positioned "Get Started" button
          Positioned(
            bottom: 150, // Position the button near the bottom of the screen
            left: 40, // Adjust horizontal positioning
            right: 40, // Adjust horizontal positioning for better centering
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the dashboard page when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashbord()), // Navigate to Dashbord
                );
              },
              child: const Text('Get Started'
                  , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1EFF00), // Button background color
                foregroundColor: const Color.fromARGB(255, 10, 10, 10), // Button text color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // Rounded corners
                ),
                elevation: 10, // Button shadow for better visibility
              ),
            ),
          ),
        ],
      ),
    );
  }
}