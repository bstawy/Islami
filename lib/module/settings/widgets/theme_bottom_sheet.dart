import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_provider.dart';
import 'selected_option_widget.dart';
import 'unselected_option_widget.dart';

class ThemeBottomSheetWidget extends StatefulWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  State<ThemeBottomSheetWidget> createState() => _ThemeBottomSheetWidgetState();
}

class _ThemeBottomSheetWidgetState extends State<ThemeBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context);

    return SizedBox(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              appProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? SelectedOption(
                    selectedOptionTitle: locale.dark,
                  )
                : UnselectedOption(
                    unselectedOptionTitle: locale.dark,
                  ),
          ),
          GestureDetector(
            onTap: () {
              appProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? UnselectedOption(
                    unselectedOptionTitle: locale.light,
                  )
                : SelectedOption(
                    selectedOptionTitle: locale.light,
                  ),
          ),
        ],
      ),
    );
  }
}
