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

    var _autuacoes = <Autuacao>[];
    try{
      var url = Uri.parse(ConsultaApi.url_webservice+"/listanotaautos/0/0/0");
      var response = await http.get(url);
      isLoading = false;
      if(response.statusCode == 200){
        var aulasJson = json.decode(response.body);
        for(var aulaJson in aulasJson){
          _autuacoes.add(Autuacao.fromJson(aulaJson));
        }
      }
    }catch(e){
      isLoading = false;
    }
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
        return Card(
          color: kCinzaMuitoClaro,
          child: InkWell(
            onTap: () {
              //_showAutuacao(context, _aulas[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Text("Código", style: TextStyle(fontFamily: 'Poppins'),),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF3A3A3A)
                  ),
                  child: Text(_list_autuacoes[index].id.toString(), style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
                ),SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: kVermelha
                      ),
                      child: Text(
                        _list_autuacoes[index].cnpj_cpf+"\n"+
                            _list_autuacoes[index].razaosocial+"\n"+
                            _list_autuacoes[index].cidade
                        , style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
                    )
                  ]
              ),
            ),
          ),

        );
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
