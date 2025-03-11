import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screens/quiz_app_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/settings_screen.dart';
// import '../screens/sign_up_screen.dart';


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
  static bool isDarkMode = false;

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
              scaffoldBackgroundColor: Colors.grey[900],
            )
          : ThemeData.light(),
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
  int _selectedTabIndex = 0;
  int _selectedDrawerIndex = 0;

  final List<Widget> _tabScreens = [
    const HomeScreen(),
    const QuizAppScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];

  final List<Widget> _drawerScreens = [
    const HomeScreen(),
    const QuizAppScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
    // const SignUpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'QUIZ APP',
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: theme.dividerColor,
            ),
            ListTile(
              leading: Icon(Icons.home, color: theme.iconTheme.color),
              title: Text('Home', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 0,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(0),
            ),
            ListTile(
              leading: Icon(Icons.quiz, color: theme.iconTheme.color),
              title: Text('Quiz', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 1,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(1),
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: theme.iconTheme.color),
              title: Text('Notifications', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 2,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(2),
            ),
            ListTile(
              leading: Icon(Icons.person, color: theme.iconTheme.color),
              title: Text('Profile', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 3,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(3),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: theme.dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Label',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: theme.iconTheme.color),
              title: Text('Settings', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 4,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(4),
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: theme.iconTheme.color),
              title: Text('Sign Up', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              selected: _selectedDrawerIndex == 5,
              selectedColor: theme.colorScheme.secondary,
              onTap: () => _selectDrawerItem(5),
            ),
          ],
        ),
      ),
      body: _selectedDrawerIndex < _tabScreens.length
          ? _tabScreens[_selectedTabIndex]
          : _drawerScreens[_selectedDrawerIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: GNav(
          color: theme.textTheme.bodyMedium?.color,
          activeColor: theme.colorScheme.onPrimary,
          tabBackgroundColor: theme.colorScheme.primary.withOpacity(0.3),
          gap: 8,
          padding: const EdgeInsets.all(16),
          rippleColor: theme.splashColor,
          onTabChange: (index) {
            setState(() {
              _selectedTabIndex = index;
              if (_selectedDrawerIndex >= _tabScreens.length) {
                _selectedDrawerIndex = 0;
              }
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
            ),
            GButton(
              icon: Icons.quiz,
              text: 'Quiz',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notifications',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              iconSize: 24,
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      if (_selectedDrawerIndex < _tabScreens.length) {
        _selectedTabIndex = _selectedDrawerIndex;
      }
    });
    Navigator.pop(context);
  }
}