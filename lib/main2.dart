import 'package:flutter/material.dart';

void main() {
  //função principal que executa o código
  //runapp - roda o app
  runApp(TelaContador());
}

class TelaContador extends StatefulWidget {
  //vc coloca aqui os parametros pra sua tela

  const TelaContador({super.key});

  @override
  //cria o estado de acordo com oq recebeu
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  //aqui vc coloca toda a sua lógica em dart

  int contador = 0; //variavel que irá mostrar o número na tela

  void add() {
    setState(() {
      //evita o recarregamento da página todas as vezes q alterar o estado
      contador++; //aumenta 1 unidade do valor da variável
    });
  }

  void sub() {
    setState(() {
       if (contador > 0) {
      contador--;
    }
    });
   
  }

  void reset() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, //tira a faixinha de debug
      //importa todos os widgets/componentes exemplo: texto, botão, navbar
      home: Scaffold(
        appBar: AppBar(title: Text("App contador")),
        body: Center(
          //ajuda a centralizar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$contador", 
              style: TextStyle(
                color: Colors.pink,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(style: TextButton.styleFrom(backgroundColor: Colors.pink), onPressed: add, child: Icon(Icons.add)),
                  TextButton(onPressed: sub, child: Icon(Icons.remove)),
                  TextButton(onPressed: reset, child: Icon(Icons.refresh)),
                ],
              ),
            ],
          ),
        ),
      ), //permite separar a tela até 3 partes
    );
  }
}
