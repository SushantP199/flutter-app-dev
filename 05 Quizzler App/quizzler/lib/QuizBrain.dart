import 'Questions.dart';

class QuizBrain {

  int _questionNumber = 0;

  final List<Questions> _questionBank = <Questions>[
    Questions(q: 'Electrons are larger than molecules ?', a: false),
    Questions(q: 'The human body has four lungs ?', a: false),
    Questions(q: 'The study of plants is known as botany ?', a: true),
    Questions(q: 'Kelvin is a measure of temperature ?', a: true),
    Questions(q: 'The human skeleton is made up of less than 100 bones ?', a: false),
    Questions(q: 'The Atlantic Ocean is the biggest ocean on Earth ?',a: false),
    Questions(q: 'Spiders have six legs ?',a: false),
    Questions(q: 'Atomic bombs work by atomic fission.',a: true),
    Questions(q: 'Sharks are mammals. ?',a: false),
    Questions(q: 'Filtration separates mixtures based upon their particle size ?',a: true),
    Questions(q: 'The chemical make up food often changes when you cook it ?', a: true),
    Questions(q: 'Herbivores eat meat ?', a: false),
    Questions(q: 'Water is an example of a chemical element ?', a: false),
    Questions(q: 'Venus is the closest planet to the Sun ?', a: false),
    
  ];

  void getNextQuestion(){
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion () {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer () {
    return _questionBank[_questionNumber].answer;
  }

  int getLength() {
    return _questionBank.length;
  }

  int questionNumber() {
    return _questionNumber;
  }

  void resetQuiz(){
    _questionNumber = 0;
  }

}