import 'package:c_sharp_interview_questions/questions.dart';

class QuestionBrain {
  final List<Question> _questionList = [
    Question(
        'Arithmetic operators are called binary operators when you use two arguments with each operator',
        true),
    Question(
        'The data components of a class often are called its iteration', false),
    Question('One execution of any loop is called a(n) pretest', false),
    Question('A class is a number that uniquely identifies an object', false),
    Question(
        'Properties have object that specify the statements that execute when a class\'s fields are accessed',
        false),
    Question(
        'The while loop checks a value at the "top" of the loop before the body has a chance to execute',
        true),
    Question('The public modifier allows unlimited access to a method', true),
    Question(
        'A destructor contains the actions you require when an instance of a class is destroyed',
        true),
    Question(
        'The block of statements executed in a loop is known as the iteration',
        false),
    Question(
        'You use the keyword switch as a modifier to indicate an output parameter',
        false)
  ];

  int _questionNum = 0;

  void nextQuestion() {
    if (_questionNum < _questionList.length - 1) {
      _questionNum++;
    } else {
      _questionNum = 0;
    }
  }

  int getTotal() {
    return _questionList.length;
  }

  int getCurrentQNo() {
    return _questionNum;
  }

  String getQuestion() {
    return _questionList[_questionNum].question;
  }

  bool getAnswer() {
    return _questionList[_questionNum].answer;
  }
}
