// quiz_app_screen.dart
import 'package:flutter/material.dart';

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

  List<Map<String, dynamic>> get quizzes => _quizzes;

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
    return const QuizAppScreenScreen();
  }
}

class QuizAppScreenScreen extends StatefulWidget {
  const QuizAppScreenScreen({super.key});
  @override
  _QuizAppScreenScreenState createState() => _QuizAppScreenScreenState();
}

class _QuizAppScreenScreenState extends State<QuizAppScreenScreen> {
  final QuizData _quizData = QuizData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quizzes')),
      body: ListView.builder(
        itemCount: _quizData.quizzes.length,
        itemBuilder: (context, index) {
          final quiz = _quizData.quizzes[index];
          return ListTile(
            title: Text(quiz['title']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _quizData.deleteQuiz(quiz['id'] as int);
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
          _showAddQuizDialog(context);
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
                    _quizData.addQuiz(titleController.text);
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
  const QuizDetailsScreen({required Key key, required this.quiz})
      : super(key: key);

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
                  decoration:
                      const InputDecoration(hintText: 'Options (comma-separated)'),
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
      appBar: AppBar(
        title: Text(widget.quiz['title']),
      ),
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