import 'package:flutter/material.dart';
import '../models/autuacao.dart';
import '../constantes/constantes.dart';
import 'package:intl/intl.dart';

class CardDeAutuacao extends StatelessWidget {
  
  const CardDeAutuacao({Key? key, required this.autuacao}) : super(key: key);
  
  final Autuacao autuacao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250,
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: kCinzaMuitoClaro,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Row(
              children: [
                Expanded(child: Column(
                  children: [
                    Text("Código", style: TextStyle(fontFamily: 'Poppins'),),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF3A3A3A)
                      ),
                      child: Text("0001", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
                    )
                  ],
                ),),
                SizedBox(width: 5,),
                Expanded(
                    flex: 2,
                    child: Column(
                  children: [
                    Text("CNPJ", style: TextStyle(fontFamily: 'Poppins'),),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: kVermelha
                      ),
                      child: Text("XX. XXX. XXX/0001-XX", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
                    )
                  ],
                )),
              ],
            ),),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Rua Valdomiro Oliveira, Bairro São José do Vale do Rio Preto, 290", style: TextStyle(fontFamily: 'Poppins')),
                Text("Município: Cristino Castro", style: TextStyle(fontFamily: 'Poppins'),),
                Text("Estado: Piauí", style: TextStyle(fontFamily: 'Poppins')),
                Text("CEP: 64920-000", style: TextStyle(fontFamily: 'Poppins')),
                Text("Telefone: (89) 98137-9720", style: TextStyle(fontFamily: 'Poppins')),

              ],
            ))
          ],
        ),

      ),
    );
  }
}
