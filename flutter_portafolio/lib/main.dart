import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_portafolio/src/my_web_page.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        initial: AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) {
          return ProviderScope(
              child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Portafolio',
            theme: theme,
            darkTheme: darkTheme,
            home: const MyWebPage(),
            scrollBehavior: MyCustomScrollBehavior(),
          ));
        });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
