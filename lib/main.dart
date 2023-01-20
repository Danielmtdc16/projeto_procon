import 'package:flutter/material.dart';
import 'pages/tela_cadastro_autuacao.dart';
import 'pages/tela_login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate
    ],
    supportedLocales: [
      const Locale('en'),
      const Locale('pt')
    ],
    home: TelaCadastroAuto(),
  ));
}

