import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/provider/app_provider.dart';
import 'core/theme/application_theme.dart';
import 'layout/home_layout.dart';
import 'module/hadeth/hadeth_details_view.dart';
import 'module/quran/quran_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(prefs),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        QuranDetailsView.routeName: (context) => const QuranDetailsView(),
        HadethDetailsView.routeName: (context) => HadethDetailsView(),
      },
    );
  }
}
