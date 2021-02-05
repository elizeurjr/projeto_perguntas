import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this._quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 18) {
      return 'Talvez você esteja começando sua jornada!';
    } else if (pontuacao < 21) {
      return 'Você lembra de algo, isso é bom!';
    } else if (pontuacao < 29) {
      return 'Muito bom!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.red,
          onPressed: _quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
