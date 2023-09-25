import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/theme/application_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',

      // Specify delegates and supported languages
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      themeMode: ThemeMode.light,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
        ),
      ),
    );
  }
}
