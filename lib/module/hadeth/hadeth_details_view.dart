import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';
import '../../core/provider/app_provider.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = 'hadeth-details-view';
  List<String> hadethContent = const [];

  HadethDetailsView({super.key});

  getHadethContent(String content) {
    hadethContent = content.split('\n');
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context);

    getHadethContent(args.content);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            appProvider.backgroundImage(),
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
              Text(
                args.title,
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const Divider(
                indent: 25,
                endIndent: 25,
                height: 0,
                thickness: 2,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: hadethContent.length,
                  itemBuilder: (context, index) => Text(
                    hadethContent[index],
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
}
