import 'package:flutter/material.dart';
import 'package:projeto_procon/models/autuacao.dart';
import '../widgets/card_de_autuacao.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("PROCON"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CardDeAutuacao(autuacao: Autuacao(dateTime: DateTime.now())),
          ],
        ),
      ),
    );
  }
}
