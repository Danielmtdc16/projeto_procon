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
  // ignore: library_private_types_in_public_api
  _SplashPage createState() => _SplashPage();

}

class _SplashPage extends State<SplashPage> with SingleTickerProviderStateMixin {
  void handleTimeoutLogin() {
    pushAndRemoveUntil(context, const TelaLogin());
  }

  void handleTimeoutTelaPrincipal() {
    pushAndRemoveUntil(context, const TelaPrincipal());
  }

  startTimeoutTelaPrincipal() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, handleTimeoutTelaPrincipal);
  }

  startTimeoutLogin() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, handleTimeoutLogin);
  }

  verificarTipoTela() async {
    User user = await SharedVar.getUser();
    // ignore: unrelated_type_equality_checks
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
    return const Center(
      child: Image(image: AssetImage('assets/imagens/logo-mppi-procon-2.png'),),
    );
  }
}