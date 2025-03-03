import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Notification'),
      // backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Notification Screen', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }
}