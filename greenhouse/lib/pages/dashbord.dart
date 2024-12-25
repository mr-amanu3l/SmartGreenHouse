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
                    imageAssetPath: './assets/green.jpg', // Image from assets
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 30), // Adding space between Pot widgets
                const Pot(), // Second Pot widget
              ],
            ),
          ),
        );
      case 1:
        return const Center(
          child: Text(
            'Manuals',
            style: TextStyle(color: Color(0xFF00FF8C), fontSize: 24),
          ),
        ); // Corrected the column for manuals content
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
      appBar: AppBar(
        title: const Text(
          'Welcome',
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
      body: _getBodyContent(), // Display the content based on the selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 0, 117, 212), // Background color of the nav bar
        selectedItemColor: const Color.fromARGB(255, 68, 0, 255), // Color of the selected tab
        unselectedItemColor: Colors.grey, // Color of the unselected tabs
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home Tab', // Adding tooltip for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Manuals',
            tooltip: 'Manual Tab', // Adding tooltip for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'Settings Tab', // Adding tooltip for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
            tooltip: 'About Us Tab', // Adding tooltip for accessibility
          ),
        ],
      ),
    );
  }
}
