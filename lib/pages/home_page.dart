import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
int questions = quizBrain.questionBankLengh();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  final String? name;
  HomePage({
    this.name,
  });
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];
  int vrai = 0, faux = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getQuestionAnswer();

    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
            title: "Quiz Fini!!",
            desc: "vous avez $vrai/$questions vrai et $faux/$questions faux",
            context: context,
          ).show();
          scoreKeeper = [];
          quizBrain.reset();
        } else {
          if (correctAnswer == userPickedAnswer) {
            scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
            vrai++;
          } else {
            scoreKeeper.add(Icon(
              Icons.close,
              color: Colors.red,
            ));
            faux++;
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String? name = widget.name;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Joueur:   $name '),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText()!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                // ignore: deprecated_member_use
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.done_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Vrai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Faux',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
