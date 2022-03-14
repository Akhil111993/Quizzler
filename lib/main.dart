import 'package:flutter/material.dart';

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
  List<String> questions = [
    'Arithmetic operators are called binary operators when you use two arguments with each operator',
    'The data components of a class often are called its iteration',
    'One execution of any loop is called a(n) pretest',
    'A class is a number that uniquely identifies an object',
    'Properties have object that specify the statements that execute when a class\'s fields are accessed',
    'The while loop checks a value at the "top" of the loop before the body has a chance to execute',
    'The public modifier allows unlimited access to a method',
    'A destructor contains the actions you require when an instance of a class is destroyed',
    'The block of statements executed in a loop is known as the iteration',
    'You use the keyword switch as a modifier to indicate an output parameter',
  ];
  List<bool> answers = [
    true,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    false,
    false
  ];
  List<Icon> icons = [];
  int _index = 0;
  int score = 0;

  void rightOrWrong(bool correct) {
    if (correct) {
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
    if (_index < questions.length - 1) {
      _index++;
    } else {
      _index = 0;

      int scoreCopy = score;
      score = 0;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondRoute(
            score: scoreCopy,
            total: questions.length,
          ),
        ),
      );
      icons.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Center(
            child: Text(
              questions[_index],
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
                setState(() {
                  rightOrWrong(answers[_index]);
                });
              },
              child: const Center(
                child: Text('True'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                setState(() {
                  rightOrWrong(!answers[_index]);
                });
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

class SecondRoute extends StatelessWidget {
  final int score;
  final int total;
  const SecondRoute({Key? key, required this.score, required this.total})
      : super(key: key);

  Text congratsText() {
    if (score <= total / 3) {
      return Text(
        'Oops!\n\nYour score is $score',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      );
    } else {
      return Text(
        'Congratulations!\n\nYour score is $score',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 40.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: congratsText(),
          ),
        ),
      ),
    );
  }
}
