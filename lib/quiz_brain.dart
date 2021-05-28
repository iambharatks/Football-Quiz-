import 'question.dart';

class QuizBrain {
  int _questionNumber = 0, _correctAnswer = 0, _wrongAnswer = 0;

  List<Question> _questionBank = [
    Question(
        questionText:
            'How many teams have won the World Cup since its inception in 1930?',
        a1: '8',
        a2: '7',
        a3: '5',
        a4: '4',
        answer: 1),
    Question(
        questionText:
            'Brazil has the most number of World Cup titles to its credit. How many times has it won the World Cup so far?',
        a1: '4',
        a2: '6',
        a3: '5',
        a4: '7',
        answer: 3),
    Question(
        questionText:
            'In which year was the football World Cup held for the first time?',
        a1: '1928',
        a2: '1930',
        a3: '1924',
        a4: '1932',
        answer: 2),
    Question(
        questionText:
            'Who of the following won the World Cup both as the captain and manager of his country\'s team?',
        a1: 'Diego Maradona',
        a2: 'Mario Zagailo',
        a3: 'Franz Beckenbauer',
        a4: 'Jupp Derwall',
        answer: 3),
    Question(
        questionText: 'Which country won the first football World Cup?',
        a1: 'Brazil',
        a2: 'Germany',
        a3: 'Uruguay',
        a4: 'Argentina',
        answer: 3),
    Question(
        questionText:
            'Who of the following became the second teenager in the history of World Cup football to score a goal in the finals?',
        a1: 'Antoine Griezmann',
        a2: 'Kylian Mbappe',
        a3: 'Paul Pogba',
        a4: 'Raphel Varane',
        answer: 2),
    Question(
        questionText:
            'Who of the following players scored a hat-trick of goals in the World Cup 2018?',
        a1: 'Cristiano Ronaldo',
        a2: 'Harry Kane',
        a3: 'Both (a) and (b)',
        a4: 'Kylian Mbappe',
        answer: 3),
    Question(
        questionText:
            'Who was selected for the Man of the Match Award in the finals of World Cup 2018?',
        a1: 'Antoine Griezmann',
        a2: 'Kylian Mbappe',
        a3: 'Paul Pogba',
        a4: 'Raphel Varane',
        answer: 1),
    Question(
        questionText:
            'How much was the prize money awarded to the World Cup winning team France at the tournament?',
        a1: '22 million dollars',
        a2: '26 million dollars',
        a3: '32 million dollars',
        a4: '38 million dollars',
        answer: 4),
    Question(
        questionText:
            'Who was selected for the Man of the Match Award in the finals of World Cup 2014?',
        a1: 'Mario Gotze',
        a2: 'Lionel Messi',
        a3: 'Cristiano Ronaldo',
        a4: 'Thomas Muller',
        answer: 1),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) _questionNumber++;
  }

  void correctAnswer() => _correctAnswer++;
  void wrongAnswer() => _wrongAnswer++;
  int getCorrectAnswer() => _correctAnswer;
  int getWrongAnswer() => _wrongAnswer;

  bool reachedEnd() => (_questionNumber == _questionBank.length - 1);

  void reset() {
    _questionNumber = 0;
    _correctAnswer = 0;
    _wrongAnswer = 0;
  }

  String getQuestionText() => _questionBank[_questionNumber].questionText;
  String getOption1() => _questionBank[_questionNumber].a1;
  String getOption2() => _questionBank[_questionNumber].a2;
  String getOption3() => _questionBank[_questionNumber].a3;
  String getOption4() => _questionBank[_questionNumber].a4;

  int getQuestionAnswer() => _questionBank[_questionNumber].answer;
}
