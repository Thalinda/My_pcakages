import 'dart:convert';

class SurveyQuizeModel {
  SurveyQuizeModel({
    required this.options,
    required this.surveyQuizId,
    required this.surveyId,
    required this.quizType,
    required this.quiz,
    required this.isRequired,
    required this.createdDate,
    required this.modifiedDate,
  });

  final List<dynamic> options;
  final int surveyQuizId;
  final int surveyId;
  final int quizType;
  final String quiz;
  final int isRequired;
  final DateTime createdDate;
  final DateTime modifiedDate;

  factory SurveyQuizeModel.fromJson(String str) =>
      SurveyQuizeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SurveyQuizeModel.fromMap(Map<String, dynamic> json) =>
      SurveyQuizeModel(
        options: List<dynamic>.from(json["options"].map((x) => x)),
        surveyQuizId: json["surveyQuizId"],
        surveyId: json["surveyId"],
        quizType: json["quizType"],
        quiz: json["quiz"],
        isRequired: json["isRequired"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedDate: DateTime.parse(json["modifiedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "options": List<dynamic>.from(options.map((x) => x)),
        "surveyQuizId": surveyQuizId,
        "surveyId": surveyId,
        "quizType": quizType,
        "quiz": quiz,
        "isRequired": isRequired,
        "createdDate": createdDate.toIso8601String(),
        "modifiedDate": modifiedDate.toIso8601String(),
      };
}
