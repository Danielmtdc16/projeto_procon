import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/models/autuacao.dart';
import 'package:projeto_procon/pages/tela_cadastro_autuacao.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/messages.dart';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/util/progress_carregamento.dart';
import 'package:projeto_procon/util/shared_var.dart';
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
  late Color offlineColor = kCinzaMuitoClaro;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  Future<List<Autuacao>> getServidor() async{
    isLoading = true;
    bool result = await InternetConnectionChecker().hasConnection;
    var _autuacoes;
    if(result==true) {
      _autuacoes = ConsultaApi().getAutuacoes();
    }else{
      offlineColor = kAmareloClaro;
      _autuacoes = ConsultaApi().getAutuacoesOffline();
    }
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return CardDeAutuacao(autuacao: _list_autuacoes[index], colorCard: offlineColor);
        },
            itemCount: _list_autuacoes.length),
      ),
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
                  _sicronizar(context);
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

  void _sicronizar(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if(result) {
      Messages.showLoadingDialog(context, _keyLoader);
      int salvo_all = 1;
      for (var autuacao in _list_autuacoes) {
        if(autuacao.salvo_servidor == 0) {
          int resp = await ConsultaApi.salvar_auto(autuacao, context);
          if (resp == 0) {
            salvo_all = 0;
            Navigator.of(context, rootNavigator: true)
                .pop(); //close the dialoge;
            Messages().msgErro("Sem acesso ao servidor!", context);
          }else{
              autuacao.id = resp;
              await ConsultaApi.uploadImagem(
                autuacao.path_assinatura, autuacao.id);
          }
        }
      }
      if (salvo_all == 1) {
        Navigator.of(context, rootNavigator: true).pop(); //close the dialoge;
        Messages().msgInfor("Sicronizado com servidor", context);
        await SharedVar.clearAutoCelulars();
        pushAndRemoveUntil(context, TelaPrincipal());
      }
    }else{
      Messages().msgErro("Sem acesso a internet!", context);
    }
  }

}
