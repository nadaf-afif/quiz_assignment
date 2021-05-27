import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quize_assignment/model/options_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quize_assignment/options_grid_view.dart';

class QuestionViewLayout extends StatefulWidget {
  Function onAnswered;

  QuestionViewLayout({
    Key key,
    @required this.onAnswered,
  }) : super(key: key);

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionViewLayout> {
  OptionsData _optionsData;
  int timerValue = 5;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _optionsData = OptionsData.fromJson(
          jsonDecode(await rootBundle.loadString('lib/data_list.json')));
      setState(() {});
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerValue == 0) {
        _timer.cancel();
      } else {
        setState(() {
          timerValue--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Oh My Quiz!",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "What is the fastest animal in the world?",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 15.0,
                animation: true,
                animationDuration: 1000,
                percent: 1.0 - (timerValue / 5),
                animateFromLastPercent: true,
                center: new Text(
                  "00:0$timerValue",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: (timerValue == 0) ? Colors.red[300] : Colors.yellow,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.red,
                backgroundColor: Colors.yellow,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: (_optionsData != null)
                  ? List.generate(
                      _optionsData.options.length,
                      (index) => Hero(
                        tag: _optionsData.options[index].optionName,
                        child: OptionsItem(
                          option: _optionsData.options[index],
                          onClicked: () {
                            widget.onAnswered(_optionsData.options[index]);
                          },
                        ),
                      ),
                    )
                  : Container(),
            ),
          )
        ],
      ),
    );
  }
}
