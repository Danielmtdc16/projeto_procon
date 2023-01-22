import 'package:flutter/material.dart';

Scaffold carregando_informacoes(context){
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Carregando ...',
            style: Theme.of(context).textTheme.headline6,
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