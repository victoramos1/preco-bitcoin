import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
            Text("R\$ 580.000,00",
              style: TextStyle(
                fontSize: 50
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: (){},
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
            )
          ],
        )
      ),
    );
  }
}
