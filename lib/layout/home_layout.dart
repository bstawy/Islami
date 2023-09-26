import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/quran/quran_view.dart';

import '../module/hadeth/hadeth_view.dart';
import '../module/radio/radio_view.dart';
import '../module/settings/settings_view.dart';
import '../module/tasbeh/tasbeh_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home-layout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<Widget> screens = const [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingsView()
  ];

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
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/quran_bottom_nav_icon.png'),
              ),
              label: locale.quran,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/ahadeth_bottom_nav_icon.png'),
              ),
              label: locale.hadeth,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/sebha_bottom_nav_icon.png'),
              ),
              label: locale.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/radio_bottom_nav_icon.png'),
              ),
              label: locale.radio,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: locale.settings,
            ),
          ],
        ),
      ),
    );
  }
}
