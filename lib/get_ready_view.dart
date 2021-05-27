import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quize_assignment/first_counter_child.dart';
import 'package:quize_assignment/second_child_view.dart';

class QuestionView extends StatefulWidget {
  QuestionView({Key key}) : super(key: key);

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  bool isStartState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_1.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: (isStartState)
              ? FirstCounterChild(onCounterCompleted: () {
                  setState(() {
                    isStartState = false;
                  });
                })
              : SecondChildWithQuestion(),
          switchInCurve: Curves.easeInOutCirc,
          switchOutCurve: Curves.easeInOutCirc,
        ),
      ),
    );
  }
}

// AnimatedCrossFade(
//           layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) =>
//               Stack(
//             children: [
//               Positioned(
//                 child: topChild,
//                 key: topChildKey,
//               ),
//               Positioned(
//                 child: bottomChild,
//                 key: bottomChildKey,
//               ),
//             ],
//           ),
//           firstChild: FirstCounterChild(
//             onCounterCompleted: () {
//               setState(() {
//                 isStartState = false;
//               });
//             },
//           ),
//           secondChild: SecondChildWithQuestion(),
//           crossFadeState: (isStartState)
//               ? CrossFadeState.showFirst
//               : CrossFadeState.showSecond,
//           duration: Duration(milliseconds: 500),
//           firstCurve: Curves.fastOutSlowIn,
//           secondCurve: Curves.fastOutSlowIn,
//           sizeCurve: Curves.bounceOut,
//         ),
