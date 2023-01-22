import 'package:flutter/material.dart';

const Color kVermelha = Color(0xFFCB0912);
const Color kCinzaClaro = Color(0xFFABABAB);
const Color kCinzaMuitoClaro = Color(0xFFE4E4E4);
const Color kAzulClaro = Color(0xFF4BA9BA);
const Color kAmareloClaro = Color(0xFFFFF8E1);

const TextStyle kTextoLogin = TextStyle(fontSize: 30, fontFamily: 'Poppins', color: kVermelha);
const TextStyle kTextosPrincipaisTelaCadastro = TextStyle(fontFamily: 'Poppins', fontSize: 20);
const TextStyle kTextosDosInputsTelaCadastro = TextStyle(fontFamily: 'Poppins', fontSize: 13);
const TextStyle kTextoDescricao = TextStyle(fontWeight: FontWeight.w300, color: kCinzaClaro);
const TextStyle kEstiloTextoContainerPersonalizado = TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w300);

const double kalturaEspacamento = 30;
const double kalturaContainerPersonalizado = 50;
const double kalturaCardDeAutuacao = 80;

const List<String> klistaDeEstados = <String>['PI', 'AL', 'AP',
'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG',
'PA', 'PB', 'PR', 'PE', 'AC', 'RJ', 'RN', 'RS', 'RO', 'RR',
'RO', 'RR', 'SC', 'SP', 'SE', 'TO'];
const List<String> klistaTiposInscricao = <String>['Inscrição Municipal', 'Inscrição Estadual'];

const InputDecoration kDecoracaoDeCampos = InputDecoration(
  hintStyle: TextStyle(color: Colors.black54),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(
      color: Colors.transparent
  ),),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(
      color: Colors.transparent
  ),),
  fillColor: kCinzaMuitoClaro,
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
);

