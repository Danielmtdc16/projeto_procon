import 'package:flutter/material.dart';
import 'package:projeto_procon/constantes/constantes.dart';

// ignore: non_constant_identifier_names
Scaffold carregando_informacoes(context){
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Carregando ...',
            style: kTextosDosInputsTelaCadastro.copyWith(fontSize: 18),
          ),
          const LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.amber,
            minHeight: 10,
          ),
        ],
      ),
    ),
  );
}