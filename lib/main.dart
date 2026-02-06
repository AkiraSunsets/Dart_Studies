//biblioteca que importa os componentes do flutter
// ignore: unused_import
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(TelaInicial()); //roda o aplicativo :D
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira a faixinha de debug
      home: Scaffold(
        //divide a tela em até 3 partes
        appBar: AppBar(
          //barra superior
          title: Text(
            "Homepage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end, //coloca o text align pro canto
          ),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 50, height: 50, color: Colors.indigo, margin: EdgeInsets.only(top: 20),),  //margin serve para margem
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.amber),
            Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 50, height: 50, color: Colors.indigo, margin: EdgeInsets.only(left: 20),),
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.amber),
              ],
            ),
          ],
        ),
      ), //puxa todos os componentes do material app para a tela
    );
  }
}
