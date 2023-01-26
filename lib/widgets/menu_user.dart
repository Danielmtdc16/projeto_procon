import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/tela_login.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/util/shared_var.dart';


class MenuUser extends StatelessWidget {

  String _nome = "";
  Future init() async {
    _nome = await SharedVar.getNome();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return PopupMenuButton(
      // add icon, by default "3 dot" icon
      // icon: Icon(Icons.book)
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Text(_nome),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text("Sair", style: kTextosDosInputsTelaCadastro,),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {

          } else if (value == 1) {
            _Logout(context);
          }
        }
    );

  }

  // ignore: non_constant_identifier_names
  Future<void> _Logout(BuildContext context) async {
    pushAndRemoveUntil(context, const TelaLogin());
  }

}