import 'package:c_sharp_interview_questions/questionBrain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBrain questionBrain = QuestionBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'C# questions',
          )),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: const _Screen(),
          ),
        ),
      ),
    );
  }
}

class _Screen extends StatefulWidget {
  const _Screen({Key? key}) : super(key: key);

  @override
  State<_Screen> createState() => _ScreenState();
}

class _ScreenState extends State<_Screen> {
  List<Icon> icons = [];
  int score = 0;

  void clearIcons() {
    icons.clear();
    score = 0;
  }

  void checkAnswer(bool answer) {
    setState(() {
      if (questionBrain.getAnswer() == answer) {
        icons.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        score++;
      } else {
        icons.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (questionBrain.getCurrentQNo() == questionBrain.getTotal() - 1) {
        Alert(
                context: context,
                title: "Congratulations!",
                desc: "You finished the quiz")
            .show();
        clearIcons();
      }
      questionBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Center(
            child: Text(
              questionBrain.getQuestion(),
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Center(
                child: Text('True'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Center(
                child: Text('False'),
              ),
            ),
            SizedBox(
              child: Row(
                children: icons,
              ),
              height: 50.0,
            ),
          ],
        ),
      ],
    );
  }
}
