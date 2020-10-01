import 'dart:math';

import 'package:corona_test/managers/navigator_manager.dart';
import 'package:corona_test/models/answer_model.dart';
import 'package:corona_test/questions/base_question_page.dart';
import 'package:corona_test/tongue_scanner_page.dart';
import 'package:flutter/material.dart';

import '../overlay_animation.dart';

class WhatIsCorona extends BaseQuestion {
  WhatIsCorona() : super();

  @override
  _WhatIsCoronaState createState() => _WhatIsCoronaState();
}

class _WhatIsCoronaState extends State<WhatIsCorona> with QuestionMixin {
  @override
  void initState() {
    super.initState();
    question = "რა არის კორონა?";
    answers = [
      ImageWithTextAnswer(false, "ლუდი",
          'https://kwtv.images.worldnow.com/images/19146338_G.jpeg', "🍺"),
      ImageWithTextAnswer(true, "ვირუსი", 'assets/corona.gif', "🦠"),
      ImageWithTextAnswer(
          false,
          "შოკოლადი",
          "https://imgix.bustle.com/uploads/image/2018/1/11/57adab24-774e-444f-a8ba-14f57a1a3990-stocksy_txp9e40d60dipn100_small_528927.jpg?w=1020&h=574&fit=crop&crop=faces&auto=format&q=70",
          "🍫"),
      ImageWithTextAnswer(
          false,
          "კორონა",
          'https://www.bbc.com/news/special/panels/13/apr/dutch_crown/img/graphic_1367311798.jpg',
          "👑"),
    ];
    backgroundColor = Colors.purple;
  }

  @override
  Widget questionBuilder(BuildContext context, {Color backgroundColor}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Center(child: questionWidget()),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: answers
                      .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedAnwer = e;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: Colors.blue,
                                      style: selectedAnwer == e
                                          ? BorderStyle.solid
                                          : BorderStyle.none)),
                              child: e.build(context))))
                      .toList(),
                ),
              ),
            ),
          ),
          buttonWidget(context, enabled: selectedAnwer != null,
              onTap: (answer) async {
            await NavigatorManager.loadRoute(context,
                child: OverlayAnimation(
                  count: Random().nextInt(10),
                  child: Text(
                    answer.hint,
                    style: TextStyle(fontSize: 50),
                  ),
                ));
            if (answer.isCorrect) {
              NavigatorManager.replacePage(context, TongueScanner());
            }
          })
        ],
      ),
    );
  }
}
