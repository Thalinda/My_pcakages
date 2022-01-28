// ignore_for_file: avoid_print, deprecated_member_use
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dynamicform/dynamicform.dart';
import 'package:my_packages/models/surveyQuiz.dart';

class DynamicForms extends StatefulWidget {
  const DynamicForms({Key? key}) : super(key: key);

  @override
  State<DynamicForms> createState() => _DynamicFormsState();
}

class _DynamicFormsState extends State<DynamicForms> {
  // final List<Map<String, dynamic>> _toggleselection = [];
  // final List<Map<String, dynamic>> _radioselection = [];
  // final List<Map<String, dynamic>> _values = [];
  List<SurveyQuizeModel> quizelist = [
    SurveyQuizeModel(
        options: [],
        surveyQuizId: 1,
        surveyId: 1,
        quizType: 3,
        quiz: "Residency Policies Survey Question 01",
        isRequired: 1,
        createdDate: DateTime.parse("2022-01-26T00:00:00"),
        modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    SurveyQuizeModel(
        options: [],
        surveyQuizId: 2,
        surveyId: 1,
        quizType: 2,
        quiz: "Residency Policies Survey Question 02",
        isRequired: 0,
        createdDate: DateTime.parse("2022-01-26T00:00:00"),
        modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    SurveyQuizeModel(
        options: [],
        surveyQuizId: 3,
        surveyId: 1,
        quizType: 2,
        quiz: "Residency Policies Survey Question 03",
        isRequired: 1,
        createdDate: DateTime.parse("2022-01-26T00:00:00"),
        modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    SurveyQuizeModel(
        options: ["NC", "NS"],
        surveyQuizId: 4,
        surveyId: 1,
        quizType: 1,
        quiz: "Residency Policies Survey Question 04",
        isRequired: 1,
        createdDate: DateTime.parse("2022-01-26T00:00:00"),
        modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    SurveyQuizeModel(
        options: ["NC", "NS"],
        surveyQuizId: 5,
        surveyId: 1,
        quizType: 1,
        quiz: "Residency Policies Survey Question 05",
        isRequired: 0,
        createdDate: DateTime.parse("2022-01-26T00:00:00"),
        modifiedDate: DateTime.parse("2022-01-26T00:00:00"))
  ];
  final List<Map<String, dynamic>> dataset = [
    {
      "surveyQuizId": 1, //rating
      "surveyId": 0,
      "quizType": 1,
      "quiz": "string",
      "isRequired": 0
    },
    {
      "surveyQuizId": 2, //rating
      "surveyId": 0,
      "quizType": 2,
      "options": ['YES', 'NO'],
      "quiz": "What is the answer?",
      "isRequired": 0
    },
    {
      "surveyQuizId": 3, //rating
      "surveyId": 0,
      "quizType": 2,
      "options": ['YES', 'NO', 'Maybe'],
      "quiz": "what is the answer?",
      "isRequired": 0
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Forms'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {});
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GenerateDyamicForm(
                  dataset: quizelist.map((e) => e.toMap()).toList()),
              RaisedButton(
                onPressed: () {
                  var data = CommonFunction().getformdata();
                  print(data);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
