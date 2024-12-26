import 'package:flutter/material.dart';
import 'package:greenhouse/pages/potdetails.dart';
import 'package:greenhouse/widgets/AboutUsCard.dart';
import 'package:greenhouse/widgets/pot.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  int _expandedCardIndex = -1;

  // Function to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to handle card expansion and collapse
  void _handleCardExpansion(int index) {
    setState(() {
      if (_expandedCardIndex == index) {
        _expandedCardIndex = -1;
      } else {
        _expandedCardIndex = index;
      }
    });
  }

  // List of people with their information (can be updated later)
  final List<Map<String, String>> aboutUsData = [
    {
      'title': 'Amanuel Million  ',
      'description':
          'We are a team committed to creating sustainable and efficient solutions for modern agriculture. Our mission is to provide innovative greenhouse systems that help growers optimize their operations and improve plant health.',
    },
    {
      'title': 'Sarah Tesfaye',
      'description':
          'Sarah brings expertise in sustainable agriculture practices and is passionate about using technology to improve crop production.',
    },
    {
      'title': 'Daniel Kibret',
      'description':
          'Daniel focuses on engineering solutions for greenhouse systems, ensuring energy efficiency and optimizing environmental conditions for plant growth.',
    },
    {
      'title': 'Daniel Kibret',
      'description':
          'Daniel focuses on engineering solutions for greenhouse systems, ensuring energy efficiency and optimizing environmental conditions for plant growth.',
    },
    
    // Add more data as needed
  ];

  // Body content for each tab
  Widget _getBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PotDetails(),
                      ),
                    );
                  },
                  child: const Pot(
                    label: 'Cactus Pot',
                    description: 'A cactus that needs minimal water.',
                    imageAssetPath: 'assets/green.jpg',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                const Pot(),
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
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/green.jpg'),
              ),
              SizedBox(height: 50),
              Text(
                'Here you can view various manuals for plant care, watering schedules, and more!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      case 2:
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 50),
              Text(
                'Bluetooth',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Members',  // Adding "Members" heading
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 255, 149),
                ),
              ),
              const SizedBox(height: 20),
              // List of About Us Cards
              Expanded(
                child: ListView.builder(
                  itemCount: aboutUsData.length,
                  itemBuilder: (context, index) {
                    return AboutUsCard(
                      title: aboutUsData[index]['title']!,
                      description: aboutUsData[index]['description']!,
                      isExpanded: _expandedCardIndex == index,
                      onExpansionChanged: () => _handleCardExpansion(index), subtitle: '',
                    );
                  },
                ),
              ),
            ],
          ),
        );
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
        elevation: 0,
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _getBodyContent(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 117, 212),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF00FF8C),
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color(0xFF011F31),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Home Tab',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Manuals',
              tooltip: 'Manual Tab',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              tooltip: 'Settings Tab',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About Us',
              tooltip: 'About Us Tab',
            ),
          ],
        ),
      ),
    );
  }
}
