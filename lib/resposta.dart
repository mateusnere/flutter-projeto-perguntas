import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final VoidCallback onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.blue,
    );

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected,
        style: style,
        child: Text(texto),
      ),
    );
  }
}
