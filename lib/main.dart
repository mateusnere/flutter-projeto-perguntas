import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resposta.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _indicePergunta = 0;
  var _notaTotal = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'texto': 'Whats your favorite color?',
      'respostas': [
        {'texto': 'Black', 'nota': 10},
        {'texto': 'Red', 'nota': 2},
        {'texto': 'Green', 'nota': 7},
        {'texto': 'White', 'nota': 9},
      ]
    },
    {
      'texto': 'Whats your favorite animal?',
      'respostas': [
        {'texto': 'Rabbit', 'nota': 6},
        {'texto': 'Dog', 'nota': 9},
        {'texto': 'Cat', 'nota': 5},
        {'texto': 'Parrot', 'nota': 7},
      ],
    },
    {
      'texto': 'Whats your favorite instructor?',
      'respostas': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'Joseph', 'nota': 9},
        {'texto': 'Peter', 'nota': 8},
        {'texto': 'Ana', 'nota': 7},
      ],
    }
  ];

  void _responder(int notaDaResposta) {
    setState(() {
      _indicePergunta++;
      _notaTotal += notaDaResposta;
    });
  }

  void _resetQuiz() {
    setState(() {
      _indicePergunta = 0;
      _notaTotal = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _indicePergunta < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? _questions[_indicePergunta].cast()['respostas']
        : [];
    List<Widget> answersWidget = answers
        .map((answer) => Resposta(answer['texto'].toString(),
            () => _responder(int.parse(answer['nota'].toString()))))
        .toList();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Questions'),
      ),
      body: hasSelectedQuestion
          ? Questionario(
              indicePergunta: _indicePergunta,
              questions: _questions,
              answersWidget: answersWidget)
          : Resultado('Congrats!\nYour result is $_notaTotal', _resetQuiz),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
