import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/settings/widgets/selected_option_widget.dart';
import 'package:islami/module/settings/widgets/unselected_option_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/app_provider.dart';


class LanguageBottomSheetWidget extends StatefulWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  State<LanguageBottomSheetWidget> createState() => _LanguageBottomSheetWidgetState();
}

class _LanguageBottomSheetWidgetState extends State<LanguageBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context);

    return Container(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              appProvider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: appProvider.currentLocal == 'en'
                ? SelectedOption(
              selectedOptionTitle: locale.english,
            )
                : UnselectedOption(
              unselectedOptionTitle: locale.english,
            ),
          ),
          GestureDetector(
            onTap: () {
              appProvider.changeLanguage('ar');
              Navigator.pop(context);

            },
            child: appProvider.currentLocal == 'en'
                ? UnselectedOption(
              unselectedOptionTitle: locale.arabic,
            )
                : SelectedOption(
              selectedOptionTitle: locale.arabic,
            ),
          ),
        ],
      ),
    );
  }
}
