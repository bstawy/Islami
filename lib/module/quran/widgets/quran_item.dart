import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  final String suraName, suraNumber;

  const QuranItem({super.key, required this.suraNumber, required this.suraName});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            suraNumber,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 2,
          height: 50,
          color: theme.colorScheme.primary,
        ),
        Expanded(
          child: Text(
            suraName,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
