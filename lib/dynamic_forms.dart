// ignore_for_file: avoid_print, deprecated_member_use
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dynamicform/dynamicform.dart';

class DynamicForms extends StatefulWidget {
  const DynamicForms({Key? key}) : super(key: key);

  @override
  State<DynamicForms> createState() => _DynamicFormsState();
}

class _DynamicFormsState extends State<DynamicForms> {
  // final List<Map<String, dynamic>> _toggleselection = [];
  // final List<Map<String, dynamic>> _radioselection = [];
  // final List<Map<String, dynamic>> _values = [];
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

    // {
    //   "surveyQuizId": 2,//radio
    //   "surveyId": 0,
    //   "quizType": 0,
    //   "option": ["no", "yes"],
    //   "quiz": "string",
    //   "isRequired": 0
    // },
    // {
    //   "surveyQuizId": 3,//textbox
    //   "surveyId": 0,
    //   "quizType": 0,
    //   "quiz": "string",
    //   "isRequired": 0
    // },
  ];

  final Map serverdata = {
    "surveyId": 0,
    "surveyTitle": "string",
    "description": "string",
    "status": 0,
    "surveyLink": "string",
    "active": 0,
    "createdDate": "2022-01-18T06:31:07.026Z",
    "modifiedDate": "2022-01-18T06:31:07.026Z",
    "surveyQuizInfo": [
      {
        "surveyQuizId": 1,
        "surveyId": 0,
        "quizType": 0,
        "quiz": "string",
        "isRequired": 0
      },
      {
        "surveyQuizId": 2,
        "surveyId": 0,
        "quizType": 0,
        "quiz": "string",
        "isRequired": 0
      },
      {
        "surveyQuizId": 3,
        "surveyId": 0,
        "quizType": 0,
        "quiz": "string",
        "isRequired": 0
      },
      {
        "surveyQuizId": 3,
        "surveyId": 0,
        "quizType": 0,
        "quiz": "string",
        "isRequired": 0
      }
    ]
  };

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
              GenerateDyamicForm(dataset: dataset),
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
