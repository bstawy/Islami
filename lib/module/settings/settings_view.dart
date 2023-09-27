import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/module/settings/widgets/language_bottom_sheet.dart';
import 'package:islami/module/settings/widgets/settings_item.dart';
import 'package:islami/module/settings/widgets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../core/provider/app_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context){
    var locale = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsItem(
              settingOptionTitle: locale.language,
              selectedOption: (appProvider.currentLocal == 'en') ? locale.english : locale.arabic ,
              onClicked: () {
                showLanguageBottomSheet(context);
              }),
          const SizedBox(height: 40),
          SettingsItem(
            settingOptionTitle: locale.theme,
            selectedOption: (appProvider.isDark()) ? locale.dark : locale.light,
            onClicked: () {
              showThemeBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
  void showLanguageBottomSheet(context) {
    var theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheetWidget(),
    );
  }

  void showThemeBottomSheet(context) {
    var theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheetWidget(),
    );
  }
}
