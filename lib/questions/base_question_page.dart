import 'package:corona_test/models/answer_model.dart';
import 'package:flutter/material.dart';

abstract class BaseQuestion extends StatefulWidget {
  static QuestionMixin of(BuildContext context) {
    return context.findAncestorStateOfType<QuestionMixin>();
  }
}

mixin QuestionMixin<T extends BaseQuestion> on State<T> {
  String question = '';
  List<Answer> answers = [];

  Answer selectedAnwer;

  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.blue,
      body: Center(
          child: AspectRatio(
              aspectRatio: 9 / 16, child: questionBuilder(context))),
    );
  }

  Widget questionBuilder(BuildContext context);

  Widget questionWidget({TextStyle style}) => Text(
        question,
        style: TextStyle(fontSize: 30, color: Colors.white).merge(style),
      );

  Widget buttonWidget(BuildContext context,
          {String title = "შემდეგი",
          Color color = Colors.blue,
          bool enabled = true,
          ValueChanged<Answer> onTap}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Material(
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: enabled
                  ? () {
                      onTap(selectedAnwer);
                    }
                  : null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Text(title,
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
            color: enabled ? color : Colors.grey
            // padding: EdgeInsets.all(30),
            // minWidth: 150,
            ),
      );
}
