import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/tela_principal.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/messages.dart';
import 'package:projeto_procon/util/nav.dart';
import '../constantes/constantes.dart';
import '../widgets/text_field.dart';
import '../widgets/container_personalizado.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final textUsername = TextEditingController();
  final textPassword = TextEditingController();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 130,
          bottom: 60,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
                width: 300,
                child: Image(image: AssetImage('assets/imagens/logo-mppi-procon-2.png'),),
              ),
              const SizedBox(height: 50,),
              const Text("Efetue o Login", style: ktextoLogin),
              const Text("Insira seu Email e Senha nos campos abaixo", style: kdescricao),
              const SizedBox(height: kalturaEspacamento,),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: textUsername,
              ),
              const SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Senha'),
                controller: textPassword,
              ),
              const SizedBox(height: kalturaEspacamento,),
              Container(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kVermelha,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () {
                    _onClickLogin(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onClickLogin(context) async {
    Messages.showLoadingDialog(context, _keyLoader);
    int resp = await ConsultaApi.login(textUsername.text, textPassword.text, context);
    Navigator.of(context,rootNavigator: true).pop();//close the dialoge;
    if (resp == 1) {
      pushAndRemoveUntil(context, TelaPrincipal());
    }else if( resp == 3){
      Messages().msgErro("Sem acesso ao servidor!", context);
    } else {
      Messages().msgErro("Usuário ou Senha Incorreto!", context);
    }
  }
}


