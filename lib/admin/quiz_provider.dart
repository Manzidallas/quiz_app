import 'package:flutter/material.dart';

class QuizProvider {
  final ValueNotifier<List<Map<String, dynamic>>> _quizzes =
      ValueNotifier([ // Initialize ValueNotifier with your quiz data
    {
      'id': 1,
      'title': 'General Knowledge Quiz',
      'questions': [],
    },
    {
      'id': 2,
      'title': 'Computer Science Quiz',
      'questions': [],
    },
  ]);

  ValueNotifier<List<Map<String, dynamic>>> get quizzes => _quizzes; // Return ValueNotifier

  void addQuiz(String title) {
    final currentQuizzes = List<Map<String, dynamic>>.from(_quizzes.value); // Get current list
    currentQuizzes.add({
      'id': DateTime.now().millisecondsSinceEpoch,
      'title': title,
      'questions': [],
    });
    _quizzes.value = currentQuizzes; // Update ValueNotifier's value, which triggers rebuilds
  }

  void deleteQuiz(int quizId) {
    final currentQuizzes = List<Map<String, dynamic>>.from(_quizzes.value); // Get current list
    currentQuizzes.removeWhere((quiz) => quiz['id'] == quizId);
    _quizzes.value = currentQuizzes; // Update ValueNotifier's value
  }
}