import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = <Icon>[];

  QuizBrain quizBrain = QuizBrain();

  bool pause = true;

  Future dialogAlert() {
    return Alert(
      context: context,
      type: AlertType.success,
      title: "Congratulations !",
      desc: "Quiz is completed ",
      buttons: [
        DialogButton(
          color: Colors.green,
          child: const Text(
            "RESET",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              quizBrain.resetQuiz();
              scorekeeper = <Icon>[];
              Navigator.pop(context);
              pause = true;
            });
          },
        ),
        DialogButton(
          color: Colors.red,
          child: const Text(
            "CANCEL",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ).show();
  }

  void answerVerify(bool userAnswer) {
    setState(() {
      if (!pause) {
        dialogAlert();
      }
      if (quizBrain.questionNumber() < quizBrain.getLength() && pause) {
        if (quizBrain.getAnswer() == userAnswer) {
          scorekeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        (quizBrain.questionNumber() == quizBrain.getLength() - 1)
            ? pause = false
            : quizBrain.getNextQuestion();
      }
    });
  }

  Expanded expandedWidget({
    required bool ansValue,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
          onPressed: () {
            answerVerify(ansValue);
          },
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        expandedWidget(ansValue: true, value: 'True', color: Colors.green),
        expandedWidget(ansValue: false, value: 'False', color: Colors.red),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

class QuizBody extends StatelessWidget {
  const QuizBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

void main() {
  var app = const QuizBody();

  runApp(app);
}
