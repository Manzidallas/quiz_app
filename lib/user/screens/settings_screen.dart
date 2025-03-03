import 'package:flutter/material.dart';
import '../logged_in/main.dart'; // Assuming main.dart is in the parent directory

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Access the isDarkMode from the QuizApp's state
  bool _isDarkMode = QuizAppState.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        // backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                    // Call a method in QuizApp to update the theme
                    _updateAppTheme(context, value);
                  },
                ),
              ],
            ),
            // Add other settings options here if needed
          ],
        ),
      ),
    );
  }

  void _updateAppTheme(BuildContext context, bool isDarkMode) {
    // Find the QuizApp widget in the widget tree and access its state
    QuizAppState? appState = context.findAncestorStateOfType<QuizAppState>();
    if (appState != null) {
      appState.setDarkMode(isDarkMode); // Call the method to update theme in QuizApp
    }
  }
}