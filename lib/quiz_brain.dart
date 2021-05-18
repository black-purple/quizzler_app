import 'question.dart';

class QuizBrain {
  int _questionNum = 0;

  List<Question> _questionBank = [
    Question('La capital de la Roumanie est \"Bucarest\".', true),
    Question(
        'Vous pouvez emmener une vache dans les escaliers, mais pas l\'inverse.',
        false),
    Question(
        'Environ un quart des os humains se trouvent dans les pieds.', true),
    Question('Le sang d\'une limace est vert', true),
    // Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('Il est illégal de faire pipi dans l\'océan au Portugal.', true),
    Question(
        'Aucun morceau de papier carré sec ne peut être plié plus de 7 fois.',
        false),
    Question(
        'À Londres, au Royaume-Uni, si vous décédez au Parlement, vous avez techniquement droit à des funérailles d\'État, car le bâtiment est considéré comme un lieu trop sacré.',
        true),
    Question(
        'Le son le plus fort produit par un animal est de 188 décibels. Cet animal est l\'éléphant d\'Afrique.',
        false),
    Question(
        'La superficie totale de deux poumons humains est d\'environ 70 mètres carrés.',
        true),
    Question('Google s\'appelait à l\'origine "Backrub".', true),
    Question(
        'Le chocolat affecte le cœur et le système nerveux d\'un chien; quelques onces suffisent pour tuer un petit chien.',
        true),
    Question(
        'En Virginie de ouest aux États-Unis, si vous heurtez accidentellement un animal avec votre voiture, vous êtes libre de le ramener à la maison pour le manger.',
        true),
  ];

  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  bool isFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }

  String getQuestionText() => _questionBank[_questionNum].questionText;

  bool getQuestionAnswer() => _questionBank[_questionNum].questionAnswer;
}
