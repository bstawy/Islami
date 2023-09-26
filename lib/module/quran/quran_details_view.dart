import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/module/quran/quran_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../main.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = 'quran-details-view';
  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  String content = '';
  List<String> suraVerses = [];
  String audioState = 'pause';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    if (content.isEmpty) {
      readFile(args.suraNumber);
    }
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
        body: Container(
          margin:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 100),
          padding: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سورة ${args.suraName}',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      (audioState == 'pause')
                          ? audioState = 'play'
                          : audioState = 'pause';
                      setState(() {});
                    },
                    child: (audioState == 'pause')
                        ? const Icon(Icons.play_circle, size: 30)
                        : const Icon(Icons.pause_circle, size: 30),
                  ),
                ],
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                height: 0,
                thickness: 2,
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: suraVerses.length,
                  itemBuilder: (context, index) => Text(
                    '(${index + 1}) ${suraVerses[index]}',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  readFile(index) async {
    String text = await rootBundle.loadString('assets/files/quran/$index.txt');
    text = text.trim();
    content = text;
    setState(() {
      suraVerses = text.split('\n');
    });
  }
}
