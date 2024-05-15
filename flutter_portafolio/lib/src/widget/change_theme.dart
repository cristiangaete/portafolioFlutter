import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  bool isIconChanged = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isIconChanged
          ? const Icon(Icons.nightlight_round)
          : const Icon(Icons.wb_sunny),
      onPressed: () {
        setState(() {
          if (isIconChanged) {
            // print('ENTRO AL dark');
            // print(isIconChanged);
            AdaptiveTheme.of(context).setDark();
          } else {
            // print('ENTRO AL light');
            // print(isIconChanged);
            AdaptiveTheme.of(context).setLight();
          }
          isIconChanged = !isIconChanged;
        });
      },
    );
  }
}
