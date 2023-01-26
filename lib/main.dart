import 'package:flutter/material.dart';
import 'package:projeto_procon/pages/splash_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate
    ],
    supportedLocales: [
      const Locale('en'),
      const Locale('pt')
    ],
    home: SplashPage(),
  ));
}
