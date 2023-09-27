import 'package:flutter/material.dart';

class UnselectedOption extends StatelessWidget {
  final String unselectedOptionTitle;
  
  const UnselectedOption({super.key, required this.unselectedOptionTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(unselectedOptionTitle, style: theme.textTheme.titleMedium,));
  }
}
