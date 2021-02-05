import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual foi o primeiro personagem criado por George Lucas?',
      'resposta': [
        {'texto': 'Darth Vader', 'pontuacao': 10},
        {'texto': 'Luke Skywalker', 'pontuacao': 5},
        {'texto': 'Yoda', 'pontuacao': 3},
        {'texto': 'Palpatine', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o nome da nave de Han Solo?',
      'resposta': [
        {'texto': 'Milenio 2000', 'pontuacao': 1},
        {'texto': 'Razor Crest', 'pontuacao': 5},
        {'texto': 'Millenium Falcon', 'pontuacao': 10},
        {'texto': 'Estrela da Morte', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o nome do padawan de Anakin?',
      'resposta': [
        {'texto': 'Ahsoka Tano', 'pontuacao': 10},
        {'texto': 'Ezra Bridger', 'pontuacao': 5},
        {'texto': 'Kanan Jarrus', 'pontuacao': 3},
        {'texto': 'Luke Skywalker', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Você é fã de Star Wars?'),
          backgroundColor: Colors.black,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
