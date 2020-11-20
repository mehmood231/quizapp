import 'package:quizzler/question.dart';
import 'package:flutter/material.dart';
class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('what is oldest name of fsd?',["lailpur", "jampur","shapur","dolpur"], 1),
    Question('pakistan national language?',["saraki","urdu","hindi","English"], 2),
    Question('what is capital city of pakistan?',["KARACHI","LAHORE","ISLAMABAD","MULTAN"], 3),
   Question('what is oldest name of fsd?',["lailpur", "jampur","shapur","dolpur"], 1),
    Question('what is oldest name of fsd?',["lailpur", "jampur","shapur","dolpur"], 1),
    Question('Who developed Flutter?',["Google","Microsoft","Facebook","Mozilla"], 1),
    Question('Which language used by Flutter',["Swift","C++","Dart","Angular"], 3),
    Question('Does flutter is used only for Android Application Devlopment?',["True","False"], 2),
    Question('In which year flutter was introduced?',["2019","2020","2015","2018"], 4),

    // Question('You can lead a cow down stairs but not up stairs.', false),
    // Question('Approximately one quarter of human bones are in the feet.', true),
    // Question('A slug\'s blood is green.', true),
    // Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    // Question('It is illegal to pee in the Ocean in Portugal.', true),
    // Question(
    //     'No piece of square dry paper can be folded in half more than 7 times.',
    //     false),
    // Question(
    //     'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
    //     true),
    // Question(
    //     'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
    //     false),
    // Question(
    //     'The total surface area of two human lungs is approximately 70 square metres.',
    //     true),
    // Question('Google was originally called \"Backrub\".', true),
    // Question(
    //     'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
    //     true),
    // Question(
    //     'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
    //     true),
  ];
  //Create Next Question Function
  void shuffle(){
  _questionBank..shuffle();
  }
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
void change_question(int index){
  _questionNumber=index;
}
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }
  int get_number(){
    return _questionNumber;
  }
  int getCorrectAnswer() {
    return _questionBank[_questionNumber].index;
  }
  List<String> getoptions(){
    return _questionBank[_questionNumber].data;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
  List<Widget> getallquestion(List<int> wrongans){
    List<Widget> temp = [];
    for(int i=0; i<wrongans.length;i++){
      int t=wrongans[i];
      temp.add(new Text( _questionBank[t].questionText+": "+_questionBank[t].data[_questionBank[t].index-1],style: TextStyle(fontSize: 20,backgroundColor: Colors.blue,color: Colors.white),));
    }
    return temp;
  }
  void reset() {
    _questionNumber = 0;
  }
}

//  void nextQuestion() {
//    if (_questionNumber < _questionBank.length - 1) {
//      _questionNumber++;
//    }
//  }
//
//  String getQuestionText() {
//    return _questionBank[_questionNumber].questionText;
//  }
//
//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

//TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

//TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

//TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
//}
