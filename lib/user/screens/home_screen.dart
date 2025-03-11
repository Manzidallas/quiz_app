import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: const Center(
        child: Text('Home Screen', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }
}