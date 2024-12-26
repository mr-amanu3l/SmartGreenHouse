import 'package:flutter/material.dart';

class AboutUsCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isExpanded;
  final VoidCallback onExpansionChanged;
  final String subtitle; // Optional subtitle field
  final Color backgroundColor; // Background color property

  const AboutUsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.onExpansionChanged,
    this.subtitle = '',
    this.backgroundColor = const Color.fromARGB(255, 0, 255, 149), // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor, // Use dynamic background color
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: onExpansionChanged,
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(description),
            ),
        ],
      ),
    );
  }
}
