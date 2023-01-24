import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:projeto_procon/constantes/constantes.dart';
import 'package:projeto_procon/models/autuacao.dart';
import 'package:projeto_procon/util/ConsultaApi.dart';
import 'package:projeto_procon/util/messages.dart';
import 'package:projeto_procon/widgets/container_personalizado.dart';
import 'package:projeto_procon/widgets/menu_user.dart';
import 'package:projeto_procon/widgets/text_field.dart';

class TelaOpcaoAssinatura extends StatefulWidget {
  const TelaOpcaoAssinatura({required this.autuacao});
  final Autuacao autuacao;
  @override
  State<TelaOpcaoAssinatura> createState() => _TelaOpcaoAssinatura(autuacao: autuacao);
}

class _TelaOpcaoAssinatura extends State<TelaOpcaoAssinatura> {
  final Autuacao autuacao;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  _TelaOpcaoAssinatura({required this.autuacao});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("PROCON"),
            centerTitle: true,
            actions: <Widget>[
              MenuUser()
            ]
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          MeuTextField(
            hintTextInput: "Email",
            style: kTextosDosInputsTelaCadastro,
            controller: _emailController,
          ),

          const SizedBox(
            height: 10,
          ),
            ContainerPersonalizado(
              cor: kAzulClaro,
                aoPressionar: (){
                _showEnviarEmail(context);
              },
              filhoContainer: Text(
                "Assinar por Email",
                style: kEstiloTextoContainerPersonalizado.copyWith(
                    fontSize: 15),
              )
            ),
          SizedBox(
            height: 20,
          ),
          ContainerPersonalizado(
            cor: kAzulClaro,
            filhoContainer: Text(
              "Assinar pelo Celular",
              style: kEstiloTextoContainerPersonalizado.copyWith(
                  fontSize: 15),
            ), aoPressionar: ()  {
            _showAssinatura(context);
            }
          ),
        ]
    ))
    );
  }

  Container getContainer(objeto){
    return Container(
        height: 50,
        margin: EdgeInsets.only(top: 0, bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
        constraints: const BoxConstraints.tightFor(width: 300, height: 50),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),

        ),
        child: objeto
    );
  }

  void _showEnviarEmail(BuildContext context) async{
    Messages.showLoadingDialog(context, _formKey);
    bool result = await InternetConnectionChecker().hasConnection;
    Navigator.of(context,rootNavigator: true).pop();//close the dialoge;
    if(result==false) {
      Messages().msgErro("Sem acesso a internet, tente mais tarde!", context);
    }else{
      autuacao.email_autuado = "carleandro7@gmail.com";
      await ConsultaApi.update_auto(autuacao, context);
      int result = await ConsultaApi.enviar_email(autuacao, context);
      if(result == 1){
        Messages().msgInfor("Email Enviado com Sucesso!", context);
      }else{
        Messages().msgErro("Erro ao enviar email!", context);
      }
    }
  }
  void _showAssinatura(BuildContext context) async{
    //Messages.showLoadingDialog(context, _formKey);
    var response = await ConsultaApi.uploadImagem(autuacao.path_assinatura, autuacao.id);
    //Navigator.of(context,rootNavigator: true).pop();//close the dialoge;
    if(response.statusCode == 200) {
      Messages().msgInfor("Assinatura Salva com Sucesso!", context);
    }else{
      Messages().msgErro("Sem acesso ao servidor!", context);
    }

  }

}