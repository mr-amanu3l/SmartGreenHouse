import 'package:flutter/material.dart';
import 'package:greenhouse/widgets/pot.dart';
import 'package:greenhouse/pages/potdetails.dart'; // Import the new page for navigation

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Body content for each tab (you can customize this)
  Widget _getBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(20.0), // Proper padding for the entire content
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PotDetails(), // Navigate to the new page
                      ),
                    );
                  },
                  child: const Pot(
                    label: 'Cactus Pot',
                    description: 'A cactus that needs minimal water.',
                    imageAssetPath: 'assets/green.jpg', // Correct the path to assets
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20), // Adding space between Pot widgets
                const Pot(), // Second Pot widget
              ],
            ),
          ),
        );
      case 1:
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Manuals',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Corrected fontWeight casing
                ),
              ),
              Image(image: image)//i You can add more widgets for the Manuals section here
              // Example: Add an image or some text below
              SizedBox(height: 50),
              Text(
                'Here you can view various manuals for plant care, watering schedules, and more!',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      case 2:
        return const Center(child: Text('Settings Tab Content'));
      case 3:
        return const Center(child: Text('About Us Tab Content'));
      default:
        return const Center(child: Text('Dashboard Content'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFf00273F),
      appBar: AppBar(
        title: const Text(
          'Welcome user',
          style: TextStyle(color: Color(0xFF00FF8C)),
        ),
        backgroundColor: const Color(0xFF011F31),
        elevation: 0, // Setting elevation to 0 for a flatter look
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the icon color (white in this case)
        ),
      ),

      body: _getBodyContent(),

      // Display the content based on the selected tab

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 117, 212), // Background color for the nav bar
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF00FF8C), // Selected tab color
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255), // Unselected tab color
          backgroundColor: const Color(0xFF011F31), // Transparent to show the container color
          type: BottomNavigationBarType.fixed, // Fixed type for navigation
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Home Tab', // Tooltip for accessibility
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Manuals',
              tooltip: 'Manual Tab', // Tooltip for accessibility
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              tooltip: 'Settings Tab',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About Us', // Correctly matching the label to functionality
              tooltip: 'About Us Tab', // Tooltip for accessibility
            ),
          ],
        ),
      ),
    );
  }
}
