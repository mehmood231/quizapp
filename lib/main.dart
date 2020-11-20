import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzler/Component11.dart';
import 'quiz_brain.dart';
// import 'splashscreen.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_alert/easy_alert.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(new AlertProvider(
    child: new SplashScreen(),
    config: new AlertConfig(ok: "OK", cancel: "CANCEL", useIosStyle: true),
  ));
  // runApp(SplashScreen());
}
Timer _timer;
int _start = 10;
int correct=0;
int wrong=0;
var minutes;
var seconds;ss
List<int> wrong_answers=[];
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => QuizApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 412.0,
            height: 672.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200.0),
              ),
              color: const Color(0xff575bdb),
              border: Border.all(width: 5.0, color: const Color(0xff070707)),
            ),
          ),
          Transform.translate(
            offset: Offset(81.0, 57.0),
            child: SizedBox(
              width: 241.0,
              height: 242.0,
              child: Component11(),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 383.0),
            child: SizedBox(
              width: 376.0,
              height: 41.0,
              child: Text(
                'splash screen by ahsan',
                style: TextStyle(
                  fontFamily: 'Consolas',
                  fontSize: 26,
                  color: const Color(0xffeb2e10),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(226.0, 732.0),
            child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Symbol',
                fontSize: 26,
                color: const Color(0xffeb2e10),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 672.0),
            child: Container(
              width: 412.0,
              height: 165.0,
              decoration: BoxDecoration(
                color: const Color(0xffe20505),
                border: Border.all(width: 7.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-16.0, 732.0),
            child: SizedBox(
              width: 446.0,
              height: 53.0,
              child: Text(
                'QUIZ APP FLUTTER',
                style: TextStyle(
                  fontFamily: 'MS Gothic',
                  fontSize: 30,
                  color: const Color(0xff0c0201),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
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

class _QuizPageState extends State<QuizPage>  {
  List<Widget> scoreKeeper = [];
  bool change=false;
  int next_que=-1;
  int working=0;

  List<Widget> _getList(BuildContext context) {
    List<String> options= quizBrain.getoptions();
    // print(options.length);
    List<Widget> temp = [];
    for (var q = 1; q<=options.length; q++) {
      temp.add(
         new Container(
             width: double.infinity,
             decoration: const BoxDecoration(
                 gradient: LinearGradient(
                   colors: <Color>[
                     Colors.red,
                     Colors.blue,
                   ],
                 ),
             ),

             child:FlatButton(
               color: Colors.black12,

               textColor: Colors.white,
               child: new Text(options[q-1],style: TextStyle(fontSize: 30),),
               onPressed: () {
                 checkAnswer(q,context);
               },
             )
         )

      );
    }
    return temp;
  }
  void checkAnswer(int userPickedAnswer,BuildContext context) {
    int correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        // Alert.alert(context, title: "Hello", content: "this is a alert")
        //     .then((_) => Alert.toast(context, "You just click ok"));
        // Alert(
        //   context: this.context,
        //   title: 'Finshed',
        //   desc: 'You\'ve reached the end of the quiz.\nTrue Answer: $correct \n Wrong Answer: $wrong',
        // ).show();
        if (userPickedAnswer == correctAnswer) {
          correct+=1;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong_answers.add(quizBrain.get_number());
          wrong+=1;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        // print(wrong);
        // print(correct);
        quizBrain.reset();
        quizBrain.shuffle();
        scoreKeeper = [];

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()));
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          correct+=1;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong_answers.add(quizBrain.get_number());


          scoreKeeper.add(
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () {

                  print("Wrong");
                  // setState(() {
                    quizBrain.change_question(quizBrain.get_number());

                    // _volume += 10;
                  // });
                  next_que = quizBrain.get_number();
                  working=wrong;
                  change=true;
                },
              ),

              );
          wrong+=1;
        }
        if (change==true){
          quizBrain.change_question(next_que);
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        TweenAnimationBuilder<Duration>(

            duration: Duration(minutes: 1),
            tween: Tween(begin: Duration(minutes: 1), end: Duration.zero),
            onEnd: () {

              print('Timer ended');
              quizBrain.reset();
              quizBrain.shuffle();
              scoreKeeper = [];

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            },
            builder: (BuildContext context, Duration value, Widget child) {
              minutes = value.inMinutes;
              seconds = value.inSeconds % 60;
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Text('$minutes:$seconds',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize:70)));
            }),
       Container(
          height: 100,
          width: 700,
          child: FlatButton(
          color: Colors.blueGrey,

          textColor: Colors.redAccent,
          child: new Text("leave the quiz",style: TextStyle(fontSize: 30),),
          onPressed: () {
            quizBrain.reset();
            quizBrain.shuffle();
            scoreKeeper = [];
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()));
          },
        ),),

        // RaisedButton(
        //   onPressed: () {},
        //   textColor: Colors.white,
        //   padding: const EdgeInsets.all(0.0),
        //   child: Container(
        //
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: <Color>[
        //           Color(0xFF0D47A1),
        //           Color(0xFF1976D2),
        //           Color(0xFF42A5F5),
        //         ],
        //       ),
        //     ),
        //     padding: const EdgeInsets.all(10.0),
        //     child:
        //     const Text('Stop Quiz', style: TextStyle(fontSize: 20)),
        //   ),
        // ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: _getList(context),
        ),

        // Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.all(15.0),
        //     child: FlatButton(
        //       textColor: Colors.white,
        //       color: Colors.green,
        //       child: Text(
        //         'True',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 20.0,
        //         ),
        //       ),
        //       onPressed: () {
        //         checkAnswer(true);
        //         //The user picked true.
        //       },
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.all(15.0),
        //     child: FlatButton(
        //       color: Colors.red,
        //       child: Text(
        //         'False',
        //         style: TextStyle(
        //           fontSize: 20.0,
        //           color: Colors.white,
        //         ),
        //       ),
        //       onPressed: () {
        //         checkAnswer(false);
        //         //The user picked false.
        //       },
        //     ),
        //   ),
        // ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results of the quiz"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizApp()));
            wrong=0;correct=0;
            wrong_answers=[];
            }
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text('True Answer: $correct'),
          Text('Wrong Answer: $wrong'),
          Column(
            children: quizBrain.getallquestion(wrong_answers),
          )
        ],)

      ),
    );
  }
}