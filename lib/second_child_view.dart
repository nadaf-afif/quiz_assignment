import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quize_assignment/answer_view.dart';

import 'package:quize_assignment/model/options_model.dart';
import 'package:quize_assignment/model/question_view.dart';

class SecondChildWithQuestion extends StatefulWidget {
  SecondChildWithQuestion({Key key}) : super(key: key);

  @override
  _SecondChildWithQuestionState createState() =>
      _SecondChildWithQuestionState();
}

class _SecondChildWithQuestionState extends State<SecondChildWithQuestion>
    with SingleTickerProviderStateMixin {
  Options _selectedOption;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 30.0,
      ),
      child: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: (_selectedOption == null)
              ? QuestionViewLayout(
                  onAnswered: (Options option) {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                )
              : AnswerView(option: _selectedOption),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOutBack,
        ),
      ),
    );
  }
}
