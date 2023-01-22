import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/tela_login.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/nav.dart';
import 'package:projeto_procon/util/shared_var.dart';
class MenuUser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return PopupMenuButton(
      // add icon, by default "3 dot" icon
      // icon: Icon(Icons.book)
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Text(ConsultaApi.nome_user),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text("Sair"),
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

  Future<void> _Logout(BuildContext context) async {
    pushAndRemoveUntil(context, TelaLogin());
  }

}