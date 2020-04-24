import 'package:flutter/material.dart';
import 'package:flutterapp3/about.dart';
import 'package:flutterapp3/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  var progress;
  var i;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    var correctattempt=0;

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "END OF QUIZ",
          buttons: [
            DialogButton(
              child: Text(
                'About',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>About())),
              width: 150,
              color: Color(0xFF59365E),
            ),
          ],
          style: AlertStyle(
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
          ),
        ).show();
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          progress = progress +1 / quizBrain.questionNumber();
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
//          i = scoreKeeper.length;
        } else {
          progress = progress+1 /quizBrain.questionNumber();
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));

        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    progress = 1/ quizBrain.questionNumber();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        leading: Hero(tag:'logo',child: Icon(Icons.question_answer)),
        title: Text('Quizzler',textAlign:TextAlign.start,style: TextStyle(fontFamily: 'Bangers'),),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right:10.0),
              child: Icon(Icons.info,size: 30,),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple[900],
      body:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        LinearProgressIndicator(
          backgroundColor: Colors.deepPurple[900],
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          value: progress,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(30),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Center(child: Text(quizBrain.getQuestionText(),textAlign: TextAlign.center
                  ,style: TextStyle(fontSize: 25.0,color: Colors.white70),)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.75,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              onPressed: (){
                setState(() {
                 checkAnswer(true);
                });
              },
              child: Text('True',style: TextStyle(fontSize: 20.0),),
          ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
        Padding(
          padding: EdgeInsets.only(left: 25.0,right: 25.0),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.75,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0), ),
            color: Colors.white,
            padding: EdgeInsets.all(15.0),
            onPressed: (){
              setState(() {
               checkAnswer(false);
              });
            },
            child: Text('False',style: TextStyle(fontSize: 20.0),),
          ),
        ),
      ],
        ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    ),
    );
  }
}
