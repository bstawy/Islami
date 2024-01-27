import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_provider.dart';
import '../radios_response.dart';

class RadioItem extends StatefulWidget {
  final RadioStation radioStation;
  final AudioPlayer player;

  const RadioItem(
      {super.key, required this.radioStation, required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  String _currentState = 'pause';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.radioStation.name!,
            //locale.quranRadioStation,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (_currentState == 'pause') {
                    await widget.player
                        .play(UrlSource(widget.radioStation.url!));
                    _currentState = 'play';
                    setState(() {});
                  }
                },
                child: ImageIcon(
                  const AssetImage('assets/images/play_icon.png'),
                  color: (appProvider.isDark())
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                  size: 50,
                ),
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () async {
                  if (_currentState == 'play') {
                    await widget.player.pause();
                    _currentState = 'pause';
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.square_rounded,
                  color: (appProvider.isDark())
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
