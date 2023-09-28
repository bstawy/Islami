import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/app_provider.dart';

class UnselectedOption extends StatelessWidget {
  final String unselectedOptionTitle;

  const UnselectedOption({super.key, required this.unselectedOptionTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      alignment: appProvider.currentLocal == 'en' ? Alignment.centerLeft : Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        unselectedOptionTitle,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
