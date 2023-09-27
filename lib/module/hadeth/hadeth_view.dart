import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/hadeth/hadeth_details_view.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  final List<HadethData> allHadethContent = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    if (allHadethContent.isEmpty) {
      readFile();
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/ahadeth_header.png',
          width: mediaQuery.width / 2,
          height: mediaQuery.height / 3.8,
          fit: BoxFit.cover,
        ),
        SizedBox(height: mediaQuery.height * 0.01),
        const Divider(
          indent: 10,
          endIndent: 10,
          height: 0,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.5),
          child: Text(
            locale.hadeth,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
          height: 0,
          thickness: 2,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HadethDetailsView.routeName,
                    arguments: allHadethContent[index]);
              },
              child: Text(
                allHadethContent[index].title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              indent: 75,
              endIndent: 75,
              height: 10,
              thickness: 1.2,
            ),
            itemCount: allHadethContent.length,
          ),
        ),
      ],
    );
  }

  void readFile() async {
    String text = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = text.split('#');

    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      String title = singleHadeth.substring(0, singleHadeth.indexOf('\n'));
      String content = singleHadeth.substring(singleHadeth.indexOf('\n') + 1);

      setState(() {
        allHadethContent.add(HadethData(title: title, content: content));
      });
    }
  }
}

class HadethData {
  final String title, content;
  const HadethData({required this.title, required this.content});
}
