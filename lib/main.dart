import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/theme/application_theme.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:islami/module/quran/quran_details_view.dart';
import 'module/hadeth/hadeth_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String currentLanguage = 'en' , currentMode = 'light';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',

      // Specify delegates and supported languages
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(currentLanguage),

      themeMode: ThemeMode.light,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,

      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName : (context) => const HomeLayout(),
        QuranDetailsView.routeName : (context) => const QuranDetailsView(),
        HadethDetailsView.routeName : (context) => HadethDetailsView(),
      },
    );
  }
}
