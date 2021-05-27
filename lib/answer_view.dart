import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:quize_assignment/model/options_model.dart';
import 'package:quize_assignment/options_grid_view.dart';

class AnswerView extends StatefulWidget {
  Options option;
  AnswerView({
    Key key,
    @required this.option,
  }) : super(key: key);

  @override
  _AnswerViewState createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      cardKey.currentState.toggleCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: Hero(
            tag: widget.option.optionName,
            child: FlipCard(
              key: cardKey,
              front: OptionsItem(
                onClicked: () {},
                option: widget.option,
              ),
              back: Container(
                margin: const EdgeInsets.all(
                  10.0,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: (widget.option.isCorrect)
                      ? Colors.green[600]
                      : Colors.red[600],
                ),
                child: Icon(
                  (widget.option.isCorrect) ? Icons.check : Icons.close,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
              direction: FlipDirection.HORIZONTAL,
              flipOnTouch: true,
            ),
          ),
        ),
      ),
    );
  }
}
