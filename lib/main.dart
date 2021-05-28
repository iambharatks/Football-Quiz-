import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/football3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );
  void checkAnswer(int userPickedAnswer) {
    if (quizBrain.reachedEnd()) {
      int correctAnswerNumber = quizBrain.getCorrectAnswer();
      int wrongAnswerNumber = quizBrain.getWrongAnswer();
      if (userPickedAnswer == quizBrain.getQuestionAnswer())
        correctAnswerNumber++;
      else
        wrongAnswerNumber++;
      Alert(
        context: context,
        style: alertStyle,
        type: (correctAnswerNumber >= wrongAnswerNumber)
            ? AlertType.success
            : AlertType.error,
        title: "QUIZ COMPLETED",
        desc: (correctAnswerNumber >= wrongAnswerNumber)
            ? 'You passed the quiz!'
            : 'You failed the quiz!',
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.check, color: Colors.green),
                Text('$correctAnswerNumber'),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.close, color: Colors.red),
                Text('$wrongAnswerNumber'),
              ],
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text(
              "RESET",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
      setState(() {
        scoreKeeper.clear();
        quizBrain.reset();
      });
    } else {
      setState(() {
        if (userPickedAnswer == quizBrain.getQuestionAnswer()) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          quizBrain.correctAnswer();
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          quizBrain.wrongAnswer();
        }
        quizBrain.nextQuestion();
      });
    }
  }

  Widget Option(int optionNumber, String option) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            child: Text(
              option,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            color: Colors.blueAccent,
            onPressed: () {
              checkAnswer(optionNumber);
            },
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Option(1, quizBrain.getOption1()),
              Option(2, quizBrain.getOption2()),
            ],
          ),
        ),
        SizedBox(),
        Expanded(
          child: Row(
            children: [
              Option(3, quizBrain.getOption3()),
              Option(4, quizBrain.getOption4())
            ],
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
