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
      'filed_type': 'TEXT',
      'key': 'fname',
      'label': 'User First Name',
      'required': true,
    },
    {
      'filed_type': 'TEXT',
      'key': 'lname',
      'label': 'User Lat Name',
    },
    {
      'filed_type': 'TEXT',
      'key': 'place',
      'label': 'Rate',
    },
    {
      'filed_type': 'TOGGLE',
      'key': 'rattings_for_pace',
      'limit': 10,
      'label': 'User Rattings',
    },
    {
      'filed_type': 'SELECT',
      'key': 'select_type',
      'items': [
        {"name": "Thalinda", "id": "1"},
        {"name": "Bandara", "id": "2"},
        {"name": "Setting", "id": "3"},
        {"name": 'Trying', "id": "4"}
      ],
      'label': 'Select Stay Type',
    },
    {
      'filed_type': 'CHECKBOX',
      'key': 'agree',
      'label': 'User Rattings',
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
