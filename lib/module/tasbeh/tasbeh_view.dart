import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  double _angle = 2 * 3.14; // angel = 360 degree <initial value>
  int _zkerCounter = 0;
  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int _currentZker = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Image.asset(
                appProvider.isDark()
                    ? 'assets/images/sebha_head_header_dark.png'
                    : 'assets/images/sebha_head_header.png',
                width: mediaQuery.width / 5.64,
                height: mediaQuery.height / 8.285,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 72),
              child: Transform.rotate(
                angle: _angle,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_angle == 0 || _zkerCounter == 33) {
                        _angle = 2 * 3.14;
                        _zkerCounter = 0;
                        (_currentZker == 2)
                            ? _currentZker = 0
                            : _currentZker++;
                      }

                      _angle -= (360 / 33) * (3.16 / 180);
                      _zkerCounter++;
                    });
                  },
                  child: Image.asset(
                    appProvider.isDark()
                        ? 'assets/images/sebha_body_header_dark.png'
                        : 'assets/images/sebha_body_header.png',
                    width: mediaQuery.width / 1.776,
                    height: mediaQuery.height / 3.718,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.height / 20.23),
        Text(
          locale.numberOfTasbeh,
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 170),
          alignment: Alignment.center,
          width: mediaQuery.width / 5.88,
          height: mediaQuery.height / 10.115,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.57),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            _zkerCounter.toString(),
            style: theme.textTheme.titleMedium,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 90),
          child: OutlinedButton(
            onPressed: () {
              if (_currentZker == 2) {
                _currentZker = 0;
              } else {
                _currentZker++;
              }
              setState(() {
                _zkerCounter = 0;
                _angle = 2 * 3.14;
              });
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(theme.colorScheme.onSecondary),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                    left: Radius.circular(50),
                  ),
                ),
              ),
            ),
            child: Text(
              azkar[_currentZker],
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.secondary),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 135, right: 135, bottom: 5),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _zkerCounter = 0;
                _currentZker = 0;
                _angle = 2 * 3.14;
              });
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(theme.colorScheme.secondary),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),
                    left: Radius.circular(50),
                  ),
                ),
              ),
            ),
            child: Text(
              locale.reset,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
