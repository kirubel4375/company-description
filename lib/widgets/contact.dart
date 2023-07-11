import 'package:flutter/material.dart';

import '../main.dart';

class ContactPage extends StatelessWidget {
  final void Function(MyRoutePath)? onNavigate;

  const ContactPage({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 20),
          // Text(
          //   'Please fill out the form below to get in touch with us.',
          //   style: TextStyle(fontSize: 16),
          // ),
          // SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     if (onNavigate != null) {
          //       onNavigate!(MyRoutePath.home());
          //     }
          //   },
          //   child: const Text('Go Back Home'),
          // ),
        ],
      ),
    );
  }
}
