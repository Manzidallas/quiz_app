// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart'; // Import Provider package
// // import 'screens/quiz_app_screen.dart'; // Import QuizAppScreenScreen
// // import 'screens/home_screen.dart'; // Import HomeScreen placeholder
// // import 'screens/profile_screen.dart'; // Import ProfileScreen placeholder
// // import 'screens/notification_screen.dart'; // Import NotificationScreen placeholder
// // import 'screens/settings_screen.dart'; // Import SettingsScreen placeholder';
// // import 'screens/sign_up_screen.dart'; // Import SignUpScreen placeholder

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
//     return ChangeNotifierProvider( // Wrap with ChangeNotifierProvider
//       create: (context) => QuizProvider(), // Provide QuizProvider
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: isDarkMode
//             ? ThemeData.dark().copyWith(
//                 scaffoldBackgroundColor: Colors.grey[900],
//               )
//             : ThemeData.light(),
//         home: const Navigation(), // Use Navigation widget as home
//       ),
//     );
//   }
// }

// class Navigation extends StatefulWidget {
//   const Navigation({super.key});

//   @override
//   State<Navigation> createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   int _selectedDrawerIndex = 0; // Track selected drawer item

//   // Screens for drawer navigation
//   final List<Widget> _drawerScreens = [
//     // const HomeScreen(), // HomeScreen placeholder
//     // const ProfileScreen(), // ProfileScreen placeholder
//     // const NotificationScreen(), // NotificationScreen placeholder
//     // const SettingsScreen(), // SettingsScreen placeholder
//     // const SignUpScreen(), // SignUpScreen placeholder
//     // const QuizAppScreen(), // Our existing QuizAppScreen
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz App'),
//         backgroundColor: theme.appBarTheme.backgroundColor,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'QUIZ APP',
//               ),
//             ),
//             Divider(
//               height: 1,
//               thickness: 1,
//               color: theme.dividerColor,
//             ),
//             ListTile(
//               leading: Icon(Icons.home, color: theme.iconTheme.color),
//               title: Text('Home', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 0,
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(0),
//             ),
//             ListTile(
//               leading: Icon(Icons.add, color: theme.iconTheme.color),
//               title: Text('Notification', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 1,
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(1),
//             ),
//             ListTile(
//               leading: Icon(Icons.notifications, color: theme.iconTheme.color),
//               title: Text('Profile', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 2,
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(2),
//             ),
//             Divider(
//               height: 1,
//               thickness: 1,
//               color: theme.dividerColor,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Label',
//                 style: TextStyle(color: theme.textTheme.bodyLarge?.color),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings, color: theme.iconTheme.color),
//               title: Text('Settings', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 3,
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(3),
//             ),
//             ListTile(
//               leading: Icon(Icons.quiz, color: theme.iconTheme.color),
//               title: Text('Quizzes', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 5, // Index for QuizAppScreen in _drawerScreens
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(5), // Navigate to QuizAppScreen
//             ),
//              ListTile(
//               leading: Icon(Icons.person_add, color: theme.iconTheme.color),
//               title: Text('Sign Up', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
//               selected: _selectedDrawerIndex == 4, // Index for SignUpScreen in _drawerScreens
//               selectedColor: theme.colorScheme.secondary,
//               onTap: () => _selectDrawerItem(4), // Navigate to SignUpScreen
//             ),
//           ],
//         ),
//       ),
//       body: _drawerScreens[_selectedDrawerIndex], // Display selected screen from drawer
//     );
//   }

//   void _selectDrawerItem(int index) {
//     setState(() {
//       _selectedDrawerIndex = index;
//     });
//     // No need to Navigator.push here as screens are already in _drawerScreens
//     Navigator.pop(context); // Just close the drawer
//   }
// }


// // **Quiz Provider (Global State Management)**  (Keep your existing QuizProvider - no changes needed here)
// class QuizProvider extends ChangeNotifier {
//   List<Map<String, dynamic>> _quizzes = [
//     {
//       'id': 1,
//       'title': 'General Knowledge Quiz',
//       'questions': [
//         {
//           'questionText': 'What is the capital of France?',
//           'options': ['Berlin', 'Paris', 'Rome', 'Madrid'],
//           'correctAnswer': 'Paris',
//         },
//         {
//           'questionText': 'Which planet is known as the Red Planet?',
//           'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
//           'correctAnswer': 'Mars',
//         },
//       ],
//     },
//     {
//       'id': 2,
//       'title': 'Computer Science Quiz',
//       'questions': [
//         {
//           'questionText': 'What does CPU stand for?',
//           'options': [
//             'Central Processing Unit',
//             'Computer Personal Unit',
//             'Central Power Unit',
//             'Common Processing Unit'
//           ],
//           'correctAnswer': 'Central Processing Unit',
//         },
//         {
//           'questionText': 'What is RAM?',
//           'options': [
//             'Random Access Memory',
//             'Read Only Memory',
//             'Random Application Module',
//             ' الروم '
//           ],
//           'correctAnswer': 'Random Access Memory',
//         },
//       ],
//     },
//   ];

//   List<Map<String, dynamic>> get quizzes => _quizzes;

//   void addQuiz(String title) {
//     _quizzes.add({
//       'id': DateTime.now().millisecondsSinceEpoch,
//       'title': title,
//       'questions': [],
//     });
//     notifyListeners();
//   }

//   void deleteQuiz(int quizId) {
//     _quizzes.removeWhere((quiz) => quiz['id'] == quizId);
//     notifyListeners();
//   }

//   void updateQuiz(int quizId, String newTitle) {
//     final quizIndex = _quizzes.indexWhere((quiz) => quiz['id'] == quizId);
//     if (quizIndex != -1) {
//       _quizzes[quizIndex]['title'] = newTitle;
//       notifyListeners();
//     }
//   }
// }



import 'package:flutter/material.dart';

void main() {
  runApp(const QuizAppScreen()); // Run QuizAppScreen directly
}

// **Quiz Data (State Management)**
class QuizData {
  List<Map<String, dynamic>> _quizzes = [
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
  }

  void deleteQuiz(int quizId) {
    _quizzes.removeWhere((quiz) => quiz['id'] == quizId);
  }

  void updateQuiz(int quizId, String newTitle) {
    final quizIndex = _quizzes.indexWhere((quiz) => quiz['id'] == quizId);
    if (quizIndex != -1) {
      _quizzes[quizIndex]['title'] = newTitle;
    }
  }
}

class QuizAppScreen extends StatelessWidget {
  const QuizAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizAppScreenScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizAppScreenScreen extends StatefulWidget {
  const QuizAppScreenScreen({super.key});
  @override
  _QuizAppScreenScreenState createState() => _QuizAppScreenScreenState();
}

class _QuizAppScreenScreenState extends State<QuizAppScreenScreen> {
  final QuizData _quizData = QuizData(); // Instantiate QuizData here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: ListView.builder(
        itemCount: _quizData.quizzes.length, // Use quizzes from _quizData
        itemBuilder: (context, index) {
          final quiz = _quizData.quizzes[index];
          return ListTile(
            title: Text(quiz['title']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _quizData.deleteQuiz(quiz['id'] as int); // Call deleteQuiz from _quizData and use setState
                });
              },
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
          _showAddQuizDialog(context); // Pass context to dialog
        },
      ),
    );
  }

  Future<void> _showAddQuizDialog(BuildContext context) async {
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
                  setState(() {
                    _quizData.addQuiz(titleController.text); // Call addQuiz from _quizData and use setState
                  });
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
      // In a more complex app, you might consider moving question management to the QuizData as well
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
