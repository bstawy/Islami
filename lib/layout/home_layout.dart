import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home-layout';

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            (MyApp.currentMode == 'light')
                ? 'assets/images/background.png'
                : 'assets/images/background_dark.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.islami),
        ),
      ),
    );
  }
}
