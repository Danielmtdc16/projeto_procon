
import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/tela_cadastro_autuacao.dart';
import '../models/autuacao.dart';
import '../constantes/constantes.dart';

class CardDeAutuacao extends StatelessWidget {
  const CardDeAutuacao({Key? key, required this.autuacao, this.colorCard = kCinzaMuitoClaro}) : super(key: key);
  
  final Autuacao autuacao;
  final Color colorCard;

  mostrarDetalhesAuto(BuildContext context, Autuacao autuacao) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TelaCadastroAuto(autuacao: autuacao,)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (autuacao.salvo_servidor == 1 ? kCinzaMuitoClaro : kAmareloClaro),
      child: InkWell(
        onTap: () {
          mostrarDetalhesAuto(context, autuacao);
          print(autuacao.tipo_inscricao);
        },
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Código", style: TextStyle(fontFamily: 'Poppins'),),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF3A3A3A)
                  ),
                  child: Text(autuacao.id.toString(), style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
                ),
                const SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: kVermelha
                  ),
                  child: Text(
                    "${autuacao.cnpj_cpf}\n${autuacao.razaosocial}\n${autuacao.cidade}",
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),
                  ),
                )
              ]
          ),
        ),
      ),

    );
  }
}
