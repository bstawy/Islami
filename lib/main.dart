import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/module/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'core/theme/application_theme.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:islami/module/quran/quran_details_view.dart';
import 'module/hadeth/hadeth_details_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',

      // Specify delegates and supported languages
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appProvider.currentLocal),

      themeMode: appProvider.currentTheme,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => HadethDetailsView(),
      },
    );
  }
}
