import "package:adaptive_theme/adaptive_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_switch/flutter_switch.dart";

class SwitchIcon extends StatelessWidget {
  const SwitchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width: 60.0,
        height: 30.0,
        valueFontSize: 20.0,
        toggleSize: 22.0,
        activeColor: const Color.fromRGBO(96, 159, 241, 1),
        // inactiveColor: const Color.fromARGB(164, 19, 13, 13),
        activeIcon: const Icon(
          Icons.nightlight_round,
          color: Color.fromARGB(255, 100, 100, 98),
        ),
        inactiveIcon: const Icon(
          Icons.wb_sunny,
          color: Color(0xFFFFDF5D),
        ),
        value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
        onToggle: (val) {
          if (val) {
            AdaptiveTheme.of(context).setDark();
          } else {
            AdaptiveTheme.of(context).setLight();
          }
        });
  }
}
