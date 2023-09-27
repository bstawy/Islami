import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  String _currentState = 'pause';

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_header.png'),
        SizedBox(height: mediaQuery.height / 15.26),
        Text(
          locale.quranRadioStation,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: mediaQuery.height / 15.26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  AssetImage((appProvider.currentLocal == 'en')
                      ? 'assets/images/previous_icon.png'
                      : 'assets/images/next_icon.png'),
                  color: (ApplicationTheme.isDark)
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _currentState = (_currentState == 'pause')
                      ? 'play'
                      : 'pause';
                  setState(() {
                  });
                },
                child: ImageIcon(
                  AssetImage((_currentState == 'pause')
                      ? 'assets/images/play_icon.png'
                      : 'assets/images/pause_icon.png'),
                  color: (appProvider.isDark())
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  AssetImage((appProvider.currentLocal == 'en')
                      ? 'assets/images/next_icon.png'
                      : 'assets/images/previous_icon.png'),
                  color: (ApplicationTheme.isDark)
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
