// import 'package:flutter/material.dart';
// import '../../database/database_helper.dart';
// import '../../models/quiz_model.dart';

// class AdminQuizScreen extends StatefulWidget {
//   @override
//   _AdminQuizScreenState createState() => _AdminQuizScreenState();
// }

// class _AdminQuizScreenState extends State<AdminQuizScreen> {
//   final DatabaseHelper _dbHelper = DatabaseHelper();
//   final TextEditingController _questionController = TextEditingController();
//   final TextEditingController _answerController = TextEditingController();
//   List<Quiz> _quizzes = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadQuizzes();
//   }

//   void _loadQuizzes() async {
//     List<Quiz> quizzes = await _dbHelper.getQuizzes();
//     setState(() {
//       _quizzes = quizzes;
//     });
//   }

//   void _addQuiz() async {
//     if (_questionController.text.isNotEmpty && _answerController.text.isNotEmpty) {
//       Quiz newQuiz = Quiz(question: _questionController.text, answer: _answerController.text);
//       await _dbHelper.insertQuiz(newQuiz);
//       _questionController.clear();
//       _answerController.clear();
//       _loadQuizzes();
//     }
//   }

//   void _deleteQuiz(int id) async {
//     await _dbHelper.deleteQuiz(id);
//     _loadQuizzes();
//   }

//   void _updateQuiz(Quiz quiz) async {
//     _questionController.text = quiz.question;
//     _answerController.text = quiz.answer;
    
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Update Quiz"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(controller: _questionController, decoration: InputDecoration(labelText: "Question")),
//               TextField(controller: _answerController, decoration: InputDecoration(labelText: "Answer")),
//             ],
//           ),
//           actions: [
//             TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
//             ElevatedButton(
//               onPressed: () async {
//                 Quiz updatedQuiz = Quiz(id: quiz.id, question: _questionController.text, answer: _answerController.text);
//                 await _dbHelper.updateQuiz(updatedQuiz);
//                 Navigator.pop(context);
//                 _loadQuizzes();
//               },
//               child: Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Admin Quiz Management")),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(controller: _questionController, decoration: InputDecoration(labelText: "Enter Question")),
//                 TextField(controller: _answerController, decoration: InputDecoration(labelText: "Enter Answer")),
//                 SizedBox(height: 10),
//                 ElevatedButton(onPressed: _addQuiz, child: Text("Add Quiz")),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _quizzes.length,
//               itemBuilder: (context, index) {
//                 Quiz quiz = _quizzes[index];
//                 return ListTile(
//                   title: Text(quiz.question),
//                   subtitle: Text("Answer: ${quiz.answer}"),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () => _updateQuiz(quiz)),
//                       IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => _deleteQuiz(quiz.id!)),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';


class QuizAppScreen extends StatefulWidget {
  const QuizAppScreen({super.key});
  @override
  _QuizAppScreenState createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {
  List<Map<String, dynamic>> quizzes = [];

  void addQuiz(String title) {
    setState(() {
      quizzes.add({
        'id': DateTime.now().millisecondsSinceEpoch,
        'title': title,
        'questions': []
      });
    });
  }

  void addQuestion(int quizId, Map<String, dynamic> question) {
    setState(() {
      quizzes.firstWhere((quiz) => quiz['id'] == quizId)['questions'].add(question);
    });
  }

  void deleteQuiz(int quizId) {
    setState(() {
      quizzes.removeWhere((quiz) => quiz['id'] == quizId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text('Quiz App')),
        body: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(quizzes[index]['title']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteQuiz(quizzes[index]['id']),
              ),
            );
          },
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addQuiz('New Quiz ${quizzes.length + 1}');
          },
        ),
      
      ),
      debugShowCheckedModeBanner: false,
    );
  }
} 
