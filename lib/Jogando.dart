import 'package:flutter/material.dart';

class Jogando extends StatefulWidget {
  final String escolhaUsuario;
  final String moeda;
  final int indice;
  const Jogando(
      {super.key,
      required this.escolhaUsuario,
      required this.moeda,
      required this.indice});

  @override
  State<Jogando> createState() => _JogandoState();
}

class _JogandoState extends State<Jogando> {
  bool _acertou(String escolhaUsuario, int indice) {
    if (((escolhaUsuario == "cara") && (indice == 0)) ||
        ((escolhaUsuario == "coroa") && (indice == 1))) {
      return true;
    }
    return false;
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
                      widget.moeda,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      (_acertou(widget.escolhaUsuario, widget.indice))
                          ? "Você acertou!"
                          : "Que pena, tente novamente.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "images/botao_voltar.png",
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
