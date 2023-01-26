import 'package:flutter/material.dart';
import 'package:projeto_procon/models/user.dart';
import 'package:projeto_procon/pages/tela_login.dart';
import 'package:projeto_procon/pages/tela_principal.dart';
import 'Dart:async';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/util/shared_var.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPage createState() => _SplashPage();

}

class _SplashPage extends State<SplashPage> with SingleTickerProviderStateMixin {
  void handleTimeoutLogin() {
    pushAndRemoveUntil(context, TelaLogin());
  }

  void handleTimeoutTelaPrincipal() {
    pushAndRemoveUntil(context, TelaPrincipal());
  }

  startTimeoutTelaPrincipal() async {
    var duration = const Duration(seconds: 2);
    return new Timer(duration, handleTimeoutTelaPrincipal);
  }

  startTimeoutLogin() async {
    var duration = const Duration(seconds: 1);
    return new Timer(duration, handleTimeoutLogin);
  }

  verificarTipoTela() async {
    User user = await SharedVar.getUser();
    if (user.id == "") {
      startTimeoutLogin();
    } else {
      startTimeoutTelaPrincipal();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarTipoTela();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return new Center(
      child: new Image(image: AssetImage('assets/imagens/logo-mppi-procon-2.png'),),
    );
  }
}