import 'dart:ui';
import 'dart:math';

import 'package:cara_coroa/Jogando.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _escolhaJogador = "";
  String _avisoUsuario = "";
  String _moedaAppEscolheu = "";
  int _indice = -1;

  void limpaEscolhaJogador() {
    setState(() {
      _escolhaJogador = "";
      _avisoUsuario = "";
    });
  }

  String _sortear() {
    var moedas = ['images/moeda_cara.png', 'images/moeda_coroa.png'];
    setState(() {
      _indice = Random().nextInt(moedas.length);
      _moedaAppEscolheu = moedas[_indice];
    });
    return _moedaAppEscolheu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(97, 189, 140, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: SingleChildScrollView(
                    child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "images/logo.png",
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _escolhaJogador = "cara";
                              _avisoUsuario = "";
                            });
                          },
                          child: Container(
                            child: Image.asset(
                              "images/moeda_cara.png",
                              width: 150,
                            ),
                            decoration: BoxDecoration(
                                border: (_escolhaJogador == "cara")
                                    ? Border.all(width: 5, color: Colors.red)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _escolhaJogador = "coroa";
                              _avisoUsuario = "";
                            });
                          },
                          child: Container(
                            child: Image.asset(
                              "images/moeda_coroa.png",
                              width: 150,
                            ),
                            decoration: BoxDecoration(
                                border: (_escolhaJogador == "coroa")
                                    ? Border.all(width: 5, color: Colors.red)
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      _avisoUsuario,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_escolhaJogador != "") {
                        _sortear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Jogando(
                                      escolhaUsuario: _escolhaJogador,
                                      moeda: _moedaAppEscolheu,
                                      indice: _indice,
                                    ))).then((rs) => limpaEscolhaJogador());
                      } else {
                        setState(() {
                          _avisoUsuario = "Selecione uma das opções acima.";
                        });
                      }
                    },
                    child: Image.asset(
                      "images/botao_jogar.png",
                      width: 150,
                    ),
                  )
                ],
              ),
            )))
          ],
        ));
  }
}
