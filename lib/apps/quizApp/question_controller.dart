// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'Questions.dart';
import 'quizCore.dart';

final _animation = RM.injectAnimation(duration: 60.seconds);
Animation get animation => _animation.curvedAnimation;
final _pageController = RM.injectTabPageView(length: questions.length);
get pageController => _pageController;
List<Question> get questions => _questions.state;
final _questions = RM.inject(() => sample_data
    .map(
      (question) => Question(
        id: question['id'].toString(),
        question: question['question'],
        options: question['options'],
        answerIndex: question['answer_index'],
        explaination: '',
      ),
    )
    .toList());
final _isAnswered = RM.inject(() => false);
bool get isAnswered => _isAnswered.state;
final _correctAns = RM.inject(() => 1);
int get correctAns => _correctAns.state;

final _selectedAns = RM.inject(() => 0);
get selectedAns => _selectedAns.state;

// for more about obs please check documentation
// RxInt _questionNumber = 1.obs;

int get questionNumber => _questionNumber.state;
final _questionNumber = RM.inject(() => 0);
int _numOfCorrectAns = 0;
int get numOfCorrectAns => _numOfCorrectAns;

// called immediately after the widget is allocated memory
// @override
// void onInit() {
//   // Our animation duration is 60 s
//   // so our plan is to fill the progress bar within 60s
//   _animationController = AnimationController(duration: Duration(seconds: 60), vsync: this);
//   _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
//     ..addListener(() {
//       // update like setState
//       update();
//     });

//   // start our animation
//   // Once 60s is completed go to the next qn
//   _animationController.forward().whenComplete(nextQuestion);
//   _pageController = PageController();
//   super.onInit();
// }

// // called just before the Controller is deleted from memory
// @override
// void onClose() {
//   // super.onClose();
//   // _animationController.dispose();
//   _pageController.dispose();
// }

void checkAns(Question question, int selectedIndex) {
  // because once user press any option then it will run
  // _isAnswered = true;
  // _correctAns = question.answer;
  // _selectedAns = selectedIndex;

  // if (_correctAns == _selectedAns) _numOfCorrectAns++;

  // // It will stop the counter
  // _animationController.stop();
  // update();

  // Once user select an ans after 3s it will go to the next qn
  Future.delayed(Duration(seconds: 3), () {
    nextQuestion();
  });
}

void nextQuestion() {
  // if (_questionNumber.value != _questions.length) {
  //   _isAnswered = false;
  //   _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

  //   // Reset the counter
  //   _animationController.reset();

  //   // Then start it again
  //   // Once timer is finish go to the next qn
  //   _animationController.forward().whenComplete(nextQuestion);
  // } else {
  //   // Get package provide us simple way to naviigate another page
  //   // Get.to(ScoreScreen());
  // }
}

void updateTheQnNum(int index) {
  // _questionNumber.value = index + 1;
}
