import 'package:flutter/material.dart';
import 'package:greenhouse/pages/dashbord.dart'; // Only import once

class Intro extends StatelessWidget {
  const Intro({super.key});

  // Method to simulate loading and then navigate to Dashboard
  Future<void> navigateWithLoading(BuildContext context) async {
    // Show loading screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoadingScreen()),
    );

    // Simulate loading
    await Future.delayed(Duration(seconds: 3)); // Simulate a loading delay

    // Once loading is done, navigate to the Dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Use Stack to layer widgets
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/green.jpg"), // Ensure path is correct
                fit: BoxFit.cover, // Make image cover the entire screen
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.85), // Black color with 50% opacity
          ),

          // Background text (behind the car)
          const Positioned(
            top: 300, // Adjust the top position of the text
            left: 40, // Adjust the left position of the text
            child: Text(
              "SMART \nGREEN HOUSE", // Your text
              style: TextStyle(
                fontSize: 45, // Adjust the font size
                color: Color(0xFF1EFF00), // Light text color
                fontWeight: FontWeight.bold,
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
                color: Color.fromARGB(255, 255, 255, 255),
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
                navigateWithLoading(context); // Navigate to the dashboard page when button is pressed
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
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

// Loading Screen to display while transitioning
class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading spinner
      ),
    );
  }
}
