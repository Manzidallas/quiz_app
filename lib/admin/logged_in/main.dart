// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// // import 'screens/sign_in_screen.dart';
// import '../main.dart';
// import '../screens/quiz_app_screen.dart';
// import '../screens/home_screen.dart';
// import '../screens/profile_screen.dart';
// import '../screens/notification_screen.dart';
// import '../screens/settings_screen.dart';
// // import 'screens/history_screen.dart';

// // Quiz Model
// class Quiz {
//   String id;
//   String title;
//   String description;
//   List<Question> questions;

//   Quiz({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.questions,
//   });
// }

// // Question Model
// class Question {
//   String text;
//   List<String> options;
//   int correctOptionIndex;

//   Question({
//     required this.text,
//     required this.options,
//     required this.correctOptionIndex,
//   });
// }

// // User History Model
// class QuizHistory {
//   final String quizId;
//   final int score;
//   final DateTime dateTaken;

//   QuizHistory({
//     required this.quizId,
//     required this.score,
//     required this.dateTaken,
//   });
// }

// void main() {
//   runApp(const QuizApp());
// }

// class QuizApp extends StatefulWidget {
//   const QuizApp({super.key});

//   @override
//   QuizAppState createState() => QuizAppState();
// }

// class QuizAppState extends State<QuizApp> {
//   static bool isDarkMode = false; // Static variable to hold theme mode

//   // Method to update the theme mode
//   void setDarkMode(bool darkMode) {
//     setState(() {
//       isDarkMode = darkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: isDarkMode
//           ? ThemeData.dark().copyWith(
//               scaffoldBackgroundColor: Colors.grey[900], // Still using grey[900] as it's part of dark theme
//               // You can further customize dark theme here if needed
//             )
//           : ThemeData.light(), // Uses default light theme
//       home: const Navigation(),
//     );
//   }
// }

// class Navigation extends StatefulWidget {
//   const Navigation({super.key});

//   @override
//   State<Navigation> createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   int _selectedTabIndex = 0; // For bottom navigation
//   int _selectedDrawerIndex = 0; // Track selected drawer item

//   // Screens for bottom navigation tabs
//   final List<Widget> _tabScreens = [
//     // const SignInScreen(),
//     // const AuthApp(),
//     const SignUpScreen(),
//     const QuizAppScreen(),
//   ];

//   // Screens for drawer navigation
//   final List<Widget> _drawerScreens = [
//     const HomeScreen(),
//     const ProfileScreen(),
//     const NotificationScreen(),
//     const SettingsScreen(),
//     // const HistoryScreen(),
//     // const SignInScreen(),
//     // const AuthApp(),
//     const SignUpScreen(),
//     const QuizAppScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz App'),
//         backgroundColor: theme.appBarTheme.backgroundColor, // Theme-aware AppBar color
//       ),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'QUIZ APP',
//                 // style: textTheme.headline6, // Using default text style from theme
//               ),
//             ),
//             Divider(
//               height: 1,
//               thickness: 1,
//               color: theme.dividerColor, // Theme-aware divider color
//             ),
//             ListTile(
//               leading: Icon(Icons.home, color: theme.iconTheme.color), // Theme-aware icon color
//               title: Text('Home', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
//               selected: _selectedDrawerIndex == 0,
//               selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
//               onTap: () => {
//                 _selectDrawerItem(0),
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const HomeScreen()), // Changed to HomeScreen
//                 )
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.add, color: theme.iconTheme.color), // Theme-aware icon color
//               title: Text('Notification', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
//               selected: _selectedDrawerIndex == 1,
//               selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
//               onTap: () => {
//                 _selectDrawerItem(1),
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NotificationScreen()),
//                 )
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.notifications, color: theme.iconTheme.color), // Theme-aware icon color
//               title: Text('Profile', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
//               selected: _selectedDrawerIndex == 2,
//               selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
//               onTap: () => {
//                 _selectDrawerItem(2),
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const ProfileScreen()),
//                 )
//               },
//             ),
//             Divider(
//               height: 1,
//               thickness: 1,
//               color: theme.dividerColor, // Theme-aware divider color
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Label',
//                 style: TextStyle(color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings, color: theme.iconTheme.color), // Theme-aware icon color
//               title: Text('Settings', style: TextStyle(color: theme.textTheme.bodyLarge?.color)), // Theme-aware text color
//               selected: _selectedDrawerIndex == 3,
//               selectedColor: theme.colorScheme.secondary, // Theme-aware selected color
//               onTap: () => {
//                 _selectDrawerItem(3),
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SettingsScreen()),
//                 )
//               },
//             ),
//           ],
//         ),
//       ),
//       // body: _tabScreens[_selectedTabIndex],
//       // bottomNavigationBar: Container(
//       //   padding: const EdgeInsets.all(20),
//       //   // margin: const EdgeInsets.all(10),
//       //   decoration: BoxDecoration(
//       //     // color: theme.bottomAppBarColor, // Theme-aware bottom app bar color
//       //     // borderRadius: BorderRadius.circular(30),
          
//       //   ),
//       //   child: GNav(
//       //     // backgroundColor: Colors.transparent,
//       //     color: theme.textTheme.bodyMedium?.color, // Theme-aware default icon/text color
//       //     activeColor: theme.colorScheme.onPrimary, // Theme-aware active icon/text color
//       //     tabBackgroundColor: theme.colorScheme.primary.withOpacity(0.3), // Theme-aware tab background color
//       //     gap: 8,
//       //     padding: const EdgeInsets.all(16),
//       //     rippleColor: theme.splashColor, // Theme-aware ripple color
//       //     onTabChange: (index) {
//       //       setState(() {
//       //         _selectedTabIndex = index;
//       //       });
//       //     },
//       //     tabs: [
//       //       GButton(
//       //         icon: Icons.login,
//       //         text: 'User',
//       //         iconSize: 24,
//       //         textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
//       //       ),
//       //       GButton(
//       //         icon: Icons.person_add,
//       //         text: 'Admin',
//       //         iconSize: 24,
//       //         textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
//       //       ),
//       //       GButton(
//       //         icon: Icons.quiz,
//       //         text: 'Quiz App',
//       //         iconSize: 24,
//       //         textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.textTheme.bodyLarge?.color), // Theme-aware text color
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }

//   void _selectDrawerItem(int index) {
//     setState(() {
//       _selectedDrawerIndex = index;
//     });
//     // Close the drawer after selecting an item.
//     Navigator.pop(context);
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider( // Wrap MaterialApp with ChangeNotifierProvider
      create: (context) => QuizProvider(), // Create and provide QuizProvider
      child: const MaterialApp(
        home: QuizAppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

// **Quiz Provider (Global State Management)**
class QuizProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _quizzes = [ // Private quiz list
    {
      'id': 1,
      'title': 'General Knowledge Quiz',
      'questions': [
        {
          'questionText': 'What is the capital of France?',
          'options': ['Berlin', 'Paris', 'Rome', 'Madrid'],
          'correctAnswer': 'Paris',
        },
        {
          'questionText': 'Which planet is known as the Red Planet?',
          'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
          'correctAnswer': 'Mars',
        },
      ],
    },
    {
      'id': 2,
      'title': 'Computer Science Quiz',
      'questions': [
        {
          'questionText': 'What does CPU stand for?',
          'options': [
            'Central Processing Unit',
            'Computer Personal Unit',
            'Central Power Unit',
            'Common Processing Unit'
          ],
          'correctAnswer': 'Central Processing Unit',
        },
        {
          'questionText': 'What is RAM?',
          'options': [
            'Random Access Memory',
            'Read Only Memory',
            'Random Application Module',
            ' الروم '
          ],
          'correctAnswer': 'Random Access Memory',
        },
      ],
    },
  ];

  List<Map<String, dynamic>> get quizzes => _quizzes; // Getter for quizzes

  void addQuiz(String title) {
    _quizzes.add({
      'id': DateTime.now().millisecondsSinceEpoch,
      'title': title,
      'questions': [],
    });
    notifyListeners(); // Notify listeners (widgets) that state has changed
  }

  void deleteQuiz(int quizId) {
    _quizzes.removeWhere((quiz) => quiz['id'] == quizId);
    notifyListeners();
  }

  void updateQuiz(int quizId, String newTitle) {
    final quizIndex = _quizzes.indexWhere((quiz) => quiz['id'] == quizId);
    if (quizIndex != -1) {
      _quizzes[quizIndex]['title'] = newTitle;
      notifyListeners();
    }
  }
}

class QuizAppScreen extends StatefulWidget {
  const QuizAppScreen({super.key});
  @override
  _QuizAppScreenState createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context); // Access QuizProvider

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz App (Global State)')),
        body: ListView.builder(
          itemCount: quizProvider.quizzes.length, // Use quizzes from Provider
          itemBuilder: (context, index) {
            final quiz = quizProvider.quizzes[index];
            return ListTile(
              title: Text(quiz['title']),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => quizProvider.deleteQuiz(quiz['id'] as int), // Call deleteQuiz from Provider
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizDetailsScreen(quiz: quiz, key: UniqueKey()),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _showAddQuizDialog(context, quizProvider); // Pass provider to dialog
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<void> _showAddQuizDialog(BuildContext context, QuizProvider quizProvider) async { // Receive QuizProvider
    TextEditingController titleController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Create New Quiz'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Quiz Title'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  quizProvider.addQuiz(titleController.text); // Call addQuiz from Provider
                  Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class QuizDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> quiz;
  const QuizDetailsScreen({required Key key, required this.quiz}) : super(key: key);

  @override
  _QuizDetailsScreenState createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    questions = List<Map<String, dynamic>>.from(widget.quiz['questions']);
  }

  void addQuestion(Map<String, dynamic> question) {
    setState(() {
      questions.add(question);
      // For simplicity in this example, question management remains local to QuizDetailsScreen
      // In a more complex app, you might consider moving question management to the QuizProvider as well
    });
  }


  Future<void> _showAddQuestionDialog(BuildContext context) async {
    TextEditingController questionController = TextEditingController();
    TextEditingController optionsController = TextEditingController();
    TextEditingController answerController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Add New Question'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(hintText: 'Question Text'),
                ),
                TextField(
                  controller: optionsController,
                  decoration: const InputDecoration(hintText: 'Options (comma-separated)'),
                ),
                TextField(
                  controller: answerController,
                  decoration: const InputDecoration(hintText: 'Correct Answer'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    optionsController.text.isNotEmpty &&
                    answerController.text.isNotEmpty) {
                  Map<String, dynamic> newQuestion = {
                    'questionText': questionController.text,
                    'options': optionsController.text
                        .split(',')
                        .map((option) => option.trim())
                        .toList(),
                    'correctAnswer': answerController.text.trim(),
                  };
                  addQuestion(newQuestion);
                  Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.quiz['title'])),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(question['questionText'] ?? 'Question Text Missing'),
            subtitle: Text(
                'Options: ${(question['options'] as List<dynamic>).join(', ')}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddQuestionDialog(context);
        },
      ),
    );
  }
}