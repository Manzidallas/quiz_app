import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'screens/sign_in_screen.dart';
import '../main.dart';
import '../screens/quiz_app_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/settings_screen.dart';
// import 'screens/history_screen.dart';

// Quiz Model
class Quiz {
  String id;
  String title;
  String description;
  List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}

// Question Model
class Question {
  String text;
  List<String> options;
  int correctOptionIndex;

 Question({
  required this.text,
  required this.options,
  required this.correctOptionIndex,
  });
}

// User History Model
class QuizHistory {
  final String quizId;
  final int score;
  final DateTime dateTaken;

  QuizHistory({
    required this.quizId,
    required this.score,
    required this.dateTaken,
  });
}

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  static bool isDarkMode = false; // Static variable to hold theme mode

  // Method to update the theme mode
  void setDarkMode(bool darkMode) {
    setState(() {
      isDarkMode = darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.grey[900], // Still using grey[900] as it's part of dark theme
              // You can further customize dark theme here if needed
            )
          : ThemeData.light(), // Uses default light theme
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedTabIndex = 0; // For bottom navigation
  int _selectedDrawerIndex = 0; // Track selected drawer item

  // Screens for bottom navigation tabs
  final List<Widget> _tabScreens = [
    const HomeScreen(),
    const QuizAppScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
    // const SignInScreen(),
    // const AuthApp(),
    // const SignUpScreen(),
  ];

  // Screens for drawer navigation
  final List<Widget> _drawerScreens = [
    const HomeScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
    // const HistoryScreen(),
    // const SignInScreen(),
    // const AuthApp(),
    const SignUpScreen(),
    const QuizAppScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: theme.appBarTheme.backgroundColor, // Theme-aware AppBar color
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'QUIZ APP',
                // style: textTheme.headline6, // Using default text style from theme
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: theme.dividerColor, // Theme-aware divider color
            ),
            ListTile(
              leading: Icon(Icons.home, color: theme.iconTheme.color), // Theme-aware icon color
              title: Text('Home', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
              selected: _selectedDrawerIndex == 0,
              selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
              onTap: () => {
                _selectDrawerItem(0),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()), // Changed to HomeScreen
                )
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: theme.iconTheme.color), // Theme-aware icon color
              title: Text('Quiz', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
              selected: _selectedDrawerIndex == 1,
              selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
              onTap: () => {
                _selectDrawerItem(1),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizAppScreen()),
                )
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: theme.iconTheme.color), // Theme-aware icon color
              title: Text('Notifications', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
              selected: _selectedDrawerIndex == 2,
              selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
              onTap: () => {
                _selectDrawerItem(2),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()),
                )
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: theme.iconTheme.color), // Theme-aware icon color
              title: Text('Profile', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
              selected: _selectedDrawerIndex == 3,
              selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
              onTap: () => {
                _selectDrawerItem(3),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                )
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: theme.dividerColor, // Theme-aware divider color
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Label',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: theme.iconTheme.color), // Theme-aware icon color
              title: Text('Settings', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
              selected: _selectedDrawerIndex == 4,
              selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
              onTap: () => {
                _selectDrawerItem(4),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                )
              },
            ),
          ],
        ),
      ),
      body: _tabScreens[_selectedTabIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: theme.bottomAppBarColor, // Theme-aware bottom app bar color
          // borderRadius: BorderRadius.circular(30),

        ),
        child: 
        GNav(
          // backgroundColor: Colors.transparent,
          color: theme.textTheme.bodyMedium?.color, // Theme-aware default icon/text color
          activeColor: theme.colorScheme.onPrimary, // Theme-aware active icon/text color
          tabBackgroundColor: theme.colorScheme.primary.withOpacity(0.3), // Theme-aware tab background color
          gap: 8,
          padding: const EdgeInsets.all(16),
          rippleColor: theme.splashColor, // Theme-aware ripple color
          onTabChange: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          
          tabs: [
            // GButton(
            //   icon: Icons.home,
            //   text: 'Home',
            //   iconSize: 24,
            //   textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
            // ),
            GButton(
              icon: Icons.quiz,
              text: 'Quiz',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
            ),
            // GButton(
            //   icon: Icons.notifications,
            //   text: 'Notifications',
            //   iconSize: 24,
            //   textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
            // ),
            // GButton(
            //   icon: Icons.person,
            //   text: 'Profile',
            //   iconSize: 24,
            //   textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
            // ),
            // GButton(
            //   icon: Icons.settings,
            //   text: 'Settings',
            //   iconSize: 24,
            //   textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
            // ),
          ],
        ),
      ),
    );
  }

  void _selectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    // Close the drawer after selecting an item.
    Navigator.pop(context);
  }
}