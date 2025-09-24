import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  String precoAtualizado = "Clique no botão";

  void buscarDados() async {
    var resposta = await http.get(Uri.parse("https://blockchain.info/ticker"));
    Map<String, dynamic> dados = {};
    dados = jsonDecode(resposta.body);

    setState(() {
      precoAtualizado = "R\$ " + dados["BRL"]["buy"].toString();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preço do Bitcoin"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200, bottom: 50),
              child: Image.asset("imagens/bitcoin.png", width: 350),
            ),
            Text("$precoAtualizado",
              style: TextStyle(
                fontSize: 50
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30, bottom: 10),
              child: ElevatedButton(
                onPressed: buscarDados,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(335, 50)
                ),
                child: Text("Atualizar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                )
              )
            ),
            Text("Preço atualizado quando há alteração")
          ],
        )
      ),
    );
  }
}
