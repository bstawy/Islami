import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String settingOptionTitle, selectedOption;
  GestureTapCallback onClicked;

  SettingsItem({
    super.key,
    required this.settingOptionTitle,
    required this.selectedOption,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          settingOptionTitle,
          style: theme.textTheme.titleLarge,
        ),
        GestureDetector(
          onTap: () {
            onClicked();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.onSecondary,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedOption,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: theme.colorScheme.onSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
