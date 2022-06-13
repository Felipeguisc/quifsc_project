enum Subject {
  all,
  math,
}

class Question {
  const Question({
    required this.subject,
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
  });

  final Subject subject;
  final int id;
  final String question;
  final List options;
  final int answer;

}
