import 'package:labs/models/Question.dart';

class QuizBrain {
  int _questionNumber = 0;

  // Dữ liệu giả (Mock Data) dành cho Việt
  final List<Question> _questionBank = [
    Question('Việt Nam thuộc khu vực Đông Nam Á đúng không?', true),
    Question('Flutter được phát triển bởi Apple?', false),
    Question('Ngôn ngữ chính để viết Flutter là Dart?', true),
    Question('Hồ Chí Minh là thành phố lớn nhất Việt Nam?', true),
    Question('Bạn có thể build ứng dụng iOS bằng máy tính Windows?', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() => _questionBank[_questionNumber].questionText;
  bool getQuestionAnswer() => _questionBank[_questionNumber].questionAnswer;
  bool isFinished() => _questionNumber >= _questionBank.length - 1;

  void reset() => _questionNumber = 0;
}
