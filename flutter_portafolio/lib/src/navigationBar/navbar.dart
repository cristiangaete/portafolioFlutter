import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_portafolio/src/my_web_page.dart';
import 'package:flutter_portafolio/src/navigationBar/navbar_bottom.dart';
import 'package:flutter_portafolio/src/widget/change_theme.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';
import 'package:flutter_portafolio/src/widget/switch_icon.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavbar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavbar();
  }
}

class DesktopNavbar extends HookConsumerWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isCrolled = ref.watch(scrolledProvider);
    // final navBarColor = isCrolled ? Colors.white : Colors.white;

    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Tooltip(
              message: 'Este portafolio fue creado en Flutter',
              child: Image.asset(
                'assets/images/flutterLogoNav.png',
                height: 80.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(child: Container()),
            const SwitchIcon(),

            NavBarBottom(
                ontap: () =>
                    ref.read(currentPageProvider.notifier).state = homeKey,
                text: 'Home'),
            NavBarBottom(
                ontap: () => ref.read(currentPageProvider.notifier).state =
                    screenshotsKey,
                text: 'Certificaciones'),
            NavBarBottom(
                ontap: () =>
                    ref.read(currentPageProvider.notifier).state = featureKey,
                text: 'Proyectos'),
            ElevatedButton(
                onPressed: () =>
                    ref.read(currentPageProvider.notifier).state = contactKey,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white),
                child: const Text('Contacto')),
            // Switch(
            //     value:
            //         AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
            //     onChanged: (value) {
            //       if (value) {
            //         AdaptiveTheme.of(context).setDark();
            //       } else {
            //         AdaptiveTheme.of(context).setLight();
            //       }
            //     })
            // const ChangueIcons(),
          ],
        ));
  }
}

class MobileNavbar extends HookConsumerWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = useState<double>(0.0);
    // final isCrolled = ref.watch(scrolledProvider);
    // final navBarColor = isCrolled ? Colors.white : Colors.white;
    // bool isIconChanged =
    //     AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          margin: const EdgeInsets.only(top: 100.0),
          curve: Curves.ease,
          height: containerHeight.value,
          child: SingleChildScrollView(
            child: Column(children: [
              NavBarBottom(
                ontap: () {
                  ref.read(currentPageProvider.notifier).state = homeKey;
                  containerHeight.value = 0;
                },
                text: 'Home',
              ),
              NavBarBottom(
                  ontap: () {
                    ref.read(currentPageProvider.notifier).state =
                        screenshotsKey;
                    containerHeight.value = 0;
                  },
                  text: 'Certificaciones'),
              NavBarBottom(
                  ontap: () {
                    ref.read(currentPageProvider.notifier).state = featureKey;
                    containerHeight.value = 0;
                  },
                  text: 'Proyectos'),
              ElevatedButton(
                  onPressed: () {
                    ref.read(currentPageProvider.notifier).state = contactKey;
                    containerHeight.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white),
                  child: const Text('Contacto')),
              // const SizedBox(height: 5.0),
              // const SwitchIcon(),

              // const ChangueIcons(),
            ]),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flutterLogoMovil.png',
                  height: 70.0,
                ),
                // const SizedBox(width: 1.0),
                // Expanded(child: Container()),
                const Spacer(),

                const ChangeTheme(),
                Material(
                  child: InkWell(
                    onTap: () {
                      final height = containerHeight.value > 0 ? 0.0 : 200.0;
                      containerHeight.value = height;
                    },
                    child: const Icon(
                      Icons.menu,
                      // color: Colors.black,
                      // size: 28,
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
