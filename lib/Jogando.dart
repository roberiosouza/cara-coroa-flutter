import 'dart:math';

import 'package:cara_coroa/Home.dart';
import 'package:flutter/material.dart';

class Jogando extends StatefulWidget {
  const Jogando({super.key});

  @override
  State<Jogando> createState() => _JogandoState();
}

class _JogandoState extends State<Jogando> {
  String? _moeda;

  String _sortear() {
    var moedas = ['images/moeda_cara.png', 'images/moeda_coroa.png'];
    _moeda = moedas[Random().nextInt(2)];

    return _moeda!;
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
                    child: Image.asset(_sortear()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Image.asset("images/botao_voltar.png"),
                  )
                ],
              ),
            )))
          ],
        ));
  }
}
