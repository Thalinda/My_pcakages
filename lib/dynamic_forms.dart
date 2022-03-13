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
        surveyQuizId: 61,
        surveyId: 28,
        quizType: 2,
        quiz: "Testing Rating with indefinite",
        isRequired: 1,
        createdDate: DateTime.parse("2022-03-12T00:00:00"),
        modifiedDate: DateTime.parse("2022-03-12T00:00:00")),
    // SurveyQuizeModel(
    //     options: ["NC", "NS"],
    //     surveyQuizId: 7,
    //     surveyId: 2,
    //     quizType: 1,
    //     quiz: "test",
    //     isRequired: 0,
    //     createdDate: DateTime.parse("2022-03-10T00:00:00"),
    //     modifiedDate: DateTime.parse("2022-03-10T00:00:00")),
    // SurveyQuizeModel(
    //     options: [],
    //     surveyQuizId: 2,
    //     surveyId: 2,
    //     quizType: 2,
    //     quiz: "Residency Policies Survey Question 02",
    //     isRequired: 0,
    //     createdDate: DateTime.parse("2022-01-26T00:00:00"),
    //     modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    // SurveyQuizeModel(
    //     options: [],
    //     surveyQuizId: 3,
    //     surveyId: 3,
    //     quizType: 2,
    //     quiz: "Residency Policies Survey Question 03",
    //     isRequired: 1,
    //     createdDate: DateTime.parse("2022-01-26T00:00:00"),
    //     modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    // SurveyQuizeModel(
    //     options: ["NC", "NS"],
    //     surveyQuizId: 4,
    //     surveyId: 4,
    //     quizType: 1,
    //     quiz: "Residency Policies Survey Question 04",
    //     isRequired: 1,
    //     createdDate: DateTime.parse("2022-01-26T00:00:00"),
    //     modifiedDate: DateTime.parse("2022-01-26T00:00:00")),
    // SurveyQuizeModel(
    //     options: ["NC", "NS"],
    //     surveyQuizId: 5,
    //     surveyId: 5,
    //     quizType: 1,
    //     quiz: "Residency Policies Survey Question 05",
    //     isRequired: 0,
    //     createdDate: DateTime.parse("2022-01-26T00:00:00"),
    //     modifiedDate: DateTime.parse("2022-01-26T00:00:00"))
  ];

  @override
  void initState() {
    super.initState();
    CommonFunction().removeData();
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
