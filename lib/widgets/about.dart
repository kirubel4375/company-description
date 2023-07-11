import 'package:flutter/material.dart';

import '../main.dart';

class AboutPage extends StatelessWidget {
  final void Function(MyRoutePath)? onNavigate;

  const AboutPage({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Image.asset(
              "assets/images/image_about.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Image.asset(
              "assets/images/image_about1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Image.asset(
              "assets/images/image_about2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) => RadialGradient(
              radius: 9.0,
              center: Alignment.topCenter,
              colors: [
                Colors.red,
                Colors.blue.shade900,
                Colors.yellow,
              ],
            ).createShader(bounds),
            child: const Text(
              'WE PROVIDE SERVICE WITH VALUE COMMITED TO BREAK THROUGH!!',
              style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
