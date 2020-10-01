import 'package:flutter/material.dart';

abstract class Answer {
  final bool isCorrect;
  final String hint;

  Answer(this.isCorrect, this.hint);
  Widget build(BuildContext context);
}

class HasTitle {
  String title;
  Widget get getTitle => Text(title);
}

class HasImage {
  String image;
  Widget get getImage {
    if (image.contains('asset')) {
      return Image.asset(
        image,
        fit: BoxFit.cover,
      );
    }
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}

class TextAnswer extends Answer with HasTitle {
  TextAnswer(bool isCorrect, String title, String hint)
      : super(isCorrect, hint) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) => this.getTitle;
}

class ImageAnswer extends Answer with HasImage {
  ImageAnswer(bool isCorrect, String image, String hint)
      : super(isCorrect, hint) {
    this.image = image;
  }

  @override
  Widget build(BuildContext context) => this.getImage;
}

class ImageWithTextAnswer extends Answer with HasImage, HasTitle {
  ImageWithTextAnswer(bool isCorrect, String title, String image, String hint)
      : super(isCorrect, hint) {
    this.title = title;
    this.image = image;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: this.getImage),
          Container(
              color: Colors.white,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: this.getTitle,
              )))
        ],
      );
}
