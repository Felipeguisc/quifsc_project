import 'options.dart';

enum Subject {
  all,
  math,
}

class Question {
  final String subject;
  final String id;
  final String title;
  final String description;
  final Options options;
  final int answer;

  Question(
    this.id,
    this.subject,
    this.title,
    this.description,
    this.options,
    this.answer,
  );

  Question.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        title = json['title'],
        description = json['description'] ?? "",
        options = Options.fromJson(json["options"]),
        answer = json['answer'],
        id = "11111";

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'title': title,
        'description': description,
        'options': options.toJson(),
        'answer': answer,
        'id': id,
      };

  @override
  String toString() {
    return 'Question{subject: $subject, title: $title, description: $description, options: $options, answer: $answer, id: $id,}';
  }
}
