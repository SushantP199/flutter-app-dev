import 'Story.dart';

class StoryBrain {

  int _storyNumber = 0;

  List<Story> _storyData = <Story>[
    Story(st:'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
    a1: 'I\'ll hop in. Thanks for the help!',
    a2: 'Better ask him if he\'s a murderer first.'),
    Story(st: 'He nods slowly, unphased by the question.',
    a1: 'At least he\'s honest. I\'ll climb in.',
    a2: 'Wait, I know how to change a tire.'),
    Story(st: 'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
    a1: 'I love Elton John! Hand him the cassette tape.',
    a2: 'It\'s him or me! You take the knife and stab him.'),
    Story(st: 'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
    a1: 'Restart',
    a2: ' '),
    Story(st: 'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    a1: 'Restart',
    a2: ' '),
    Story(st: 'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
    a1: 'Restart',
    a2: ' '),
  ];

  void nextStory(int choice) {
    // print("\nnfrom $_storyNumber");
    switch(_storyNumber){

      case 0: (choice == 1) ? _storyNumber = 2 :  _storyNumber = 1;
               print("$_storyNumber");
              break;
      case 1: (choice == 1) ? _storyNumber = 2 :  _storyNumber = 3;
               print("$_storyNumber");
              break;
      case 2: (choice == 1) ? _storyNumber = 5 :  _storyNumber = 4;
               print("$_storyNumber");
              break;
      case 3: if (choice == 1) _storyNumber = 0; 
              break;
      case 4: if (choice == 1) _storyNumber = 0; 
              break;
      case 5: if (choice == 1) _storyNumber = 0 ;
              break;
    }
    // print("to$_storyNumber");
  }

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getActionOne() {
    return _storyData[_storyNumber].actionOne;
  }

  String getActionTwo() {
    return _storyData[_storyNumber].actionTwo;
  }

  int getStoryNumber(){
    return _storyNumber;
  }
}

