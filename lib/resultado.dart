import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String texto;
  final void Function() resetQuiz;

  Resultado(this.texto, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: const Text(
            'Reset?',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
