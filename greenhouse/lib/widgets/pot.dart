import 'package:flutter/material.dart';

class Pot extends StatelessWidget {
  final String label;
  final String description;
  final String imageAssetPath; // Path for image from assets
  final Color color;
  final double height;
  final double width;

  // Constructor for Pot with label, description, and image
  const Pot({
    super.key,
    this.label = 'Pot',
    this.description = '',
    this.imageAssetPath = '', // Image from assets
    this.color = const Color(0xFF011F31),
    this.height = 250,
    this.width = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width, // Customizable height
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color, // Customizable background color
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Stack(
        children: [
          // Background Image
          if (imageAssetPath.isNotEmpty)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40), // Rounded corners for the image
                child: Image.asset(
                  imageAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Colored semi-transparent overlay container
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF001426).withOpacity(0.7), // Overlay with low opacity
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          // Text Content
          Padding(
            padding: const EdgeInsets.all(20.0), // Add padding inside the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // Label
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Make label bold
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 2), // Add space between label and description
                // Description (Optional, shown only if it's not empty)
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
