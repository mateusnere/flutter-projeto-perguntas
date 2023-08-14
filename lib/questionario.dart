import 'package:flutter/material.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final int indicePergunta;
  final List<Map<String, Object>> questions;
  final List<Widget> answersWidget;

  const Questionario({
    required this.indicePergunta,
    required this.questions,
    required this.answersWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(questions[indicePergunta]['texto'].toString()),
        ...answersWidget
      ],
    );
  }
}
