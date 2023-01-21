import 'package:flutter/material.dart';
import '../models/autuacao.dart';
import '../constantes/constantes.dart';
import 'package:intl/intl.dart';

class CardDeAutuacao extends StatelessWidget {
  
  const CardDeAutuacao({Key? key, required this.autuacao}) : super(key: key);
  
  final Autuacao autuacao;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: kCinzaMuitoClaro,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
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
          Expanded(flex: 1, child: Column(
            children: [
              Text("Razão Social", style: TextStyle(fontFamily: 'Poppins'),),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: kVermelha
                ),
                child: Text("Sel Clim", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
              )
            ],
          ),),
          Expanded(
            flex: 1,
              child: Column(
            children: [
              Text("Município", style: TextStyle(fontFamily: 'Poppins'),),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF3A3A3A)
                ),
                child: Text("Cristino Castro", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Poppins'),),
              )
            ],
          )),
        ],
      ),

    );
  }
}
