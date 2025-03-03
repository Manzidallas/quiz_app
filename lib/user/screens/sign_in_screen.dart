import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Theme-aware background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign In', style: TextStyle(fontSize: 24, color: theme.textTheme.displayLarge?.color)), // Theme-aware text color
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)), // Theme-aware label text color
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor, // Theme-aware fill color for input
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: theme.textTheme.bodyLarge?.color), // Theme-aware input text color
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: theme.colorScheme.secondary, // Theme-aware button color
                // ),
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}