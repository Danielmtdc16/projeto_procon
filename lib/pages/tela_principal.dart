import 'package:flutter/foundation.dart';
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


class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // ignore: non_constant_identifier_names
  final _list_autuacoes = <Autuacao>[];
  late bool isLoading = false;
  late Color offlineColor = kCinzaMuitoClaro;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  Future<List<Autuacao>> getServidor() async{
    isLoading = true;
    bool result = await InternetConnectionChecker().hasConnection;
    List<Autuacao> autuacoes;
    if(result==true) {
      autuacoes = await ConsultaApi().getAutuacoes();
    }else{
      offlineColor = kAmareloClaro;
      autuacoes = await ConsultaApi().getAutuacoesOffline();
    }
    isLoading = false;

    return autuacoes;
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
    return isLoading ? carregando_informacoes(context) : tela();
  }

  Scaffold tela(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("PROCON", style: kTextosDosInputsTelaCadastro.copyWith(fontSize: 18),),
        centerTitle: true,
          actions: <Widget>[
            MenuUser()
            ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(child: CardDeAutuacao(autuacao: _list_autuacoes[index], colorCard: offlineColor));
        },
            itemCount: _list_autuacoes.length),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: kTextosDosInputsTelaCadastro,
        unselectedLabelStyle: kTextosDosInputsTelaCadastro,
        currentIndex: 0,
        fixedColor: kVermelha,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () {
                  _novoAuto(context);
                },
              ),
              label: "Nova Auto"
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.account_tree_rounded),
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
      // ignore: use_build_context_synchronously
      Messages.showLoadingDialog(context, _keyLoader);
      int salvoAll = 1;
      for (var autuacao in _list_autuacoes) {
        if(autuacao.salvo_servidor == 0) {
          // ignore: use_build_context_synchronously
          int resp = await ConsultaApi.salvar_auto(autuacao, context);
          if (resp == 0) {
            salvoAll = 0;
            // ignore: use_build_context_synchronously
            Navigator.of(context, rootNavigator: true).pop(); //close the dialoge;
            // ignore: use_build_context_synchronously
            Messages().msgErro("Sem acesso ao servidor!", context);
          }else{
              autuacao.id = resp;
              await ConsultaApi.uploadImagem(
                autuacao.path_assinatura, autuacao.id);
          }
        }
      }
      if (salvoAll == 1) {
        // ignore: use_build_context_synchronously
        Navigator.of(context, rootNavigator: true).pop(); //close the dialoge;

        // ignore: use_build_context_synchronously
        Messages().msgInfor("Sicronizado com servidor", context);
        await SharedVar.clearAutoCelulars();
        // ignore: use_build_context_synchronously
        pushAndRemoveUntil(context, const TelaPrincipal());
      }
    }else{
      // ignore: use_build_context_synchronously
      Messages().msgErro("Sem acesso a internet!", context);
    }
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Autuacao>('_list_autuacoes', _list_autuacoes));
    properties.add(IterableProperty<Autuacao>('_list_autuacoes', _list_autuacoes));
    properties.add(IterableProperty<Autuacao>('_list_autuacoes', _list_autuacoes));
  }

}
