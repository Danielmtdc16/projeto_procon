import 'dart:convert';

class ResultCep {

  String cep;
  String logradouro;
  String bairro;
  String localidade;

  ResultCep({required this.cep, required this.logradouro, required this.bairro, required this.localidade});

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(
      cep: json["cep"],
      logradouro: json["logradouro"],
      bairro: json["bairro"],
      localidade: json["localidade"],
  );

}