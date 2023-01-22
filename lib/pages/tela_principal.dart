import 'package:flutter/material.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/models/autuacao.dart';
import 'package:projeto_procon/pages/tela_cadastro_autuacao.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/util/progress_carregamento.dart';
import 'package:projeto_procon/widgets/menu_user.dart';
import '../widgets/card_de_autuacao.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Autuacao> _list_autuacoes = <Autuacao>[];
  late bool isLoading = false;

  Future<List<Autuacao>> getServidor() async{
    isLoading = true;
    var _autuacoes = ConsultaApi().getAutuacoes();
    isLoading = false;
    return _autuacoes;
  }

  @override
  void initState(){
    getServidor().then((value){
      setState((){
        _list_autuacoes.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return this.isLoading ? carregando_informacoes(context) : tela();
  }

  Scaffold tela(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("PROCON"),
        centerTitle: true,
          actions: <Widget>[
            MenuUser()
            ]
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return CardDeAutuacao(autuacao: _list_autuacoes[index]);
      },
          itemCount: _list_autuacoes.length),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.add_box_rounded),
                onPressed: () {
                  _novoAuto(context);
                },
              ),
              label: "Nova Auto"
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.account_tree_rounded),
                onPressed: () {
                  //_showCadastrarAula(context, disciplina);
                },
              ),
              label: "Sicronizar"
          ),


        ],
      ),
    );
  }
  void _novoAuto(BuildContext context) {
    push(context, TelaCadastroAuto());
  }

}
