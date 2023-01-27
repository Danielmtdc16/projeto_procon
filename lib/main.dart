import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/tela_login.dart';
import 'package:projeto_procon/pages/tela_principal.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate
    ],
    supportedLocales: [
      Locale('en'),
      Locale('pt')
    ],
    home: TelaPrincipal(),
  ));
}
