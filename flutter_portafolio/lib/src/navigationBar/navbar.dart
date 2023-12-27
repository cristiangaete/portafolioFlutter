import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portafolio/src/my_web_page.dart';
import 'package:flutter_portafolio/src/navigationBar/navbar_bottom.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';
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
    final isCrolled = ref.watch(scrolledProvider);
    final navBarColor = isCrolled ? Colors.white : Colors.white;

    return Container(
      //  color: navBarColor,
      decoration: BoxDecoration(color: navBarColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(0, 2),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ]),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Tooltip(
                message: 'Este portafolio fue creado en Flutter',
                child: Image.asset(
                  'assets/images/flutterLogo.png',
                  height: 80.0,
                ),
              ),
              SizedBox(width: 10.0),
              // Text(
              //   'Cristian Gaete',
              //   style: TextStyle(
              //       fontWeight: FontWeight.w700,
              //       color: Colors.black87,
              //       fontSize: 32),
              // ),
              Expanded(child: Container()),
              NavBarBottom(
                  ontap: () =>
                      ref.read(currentPageProvider.notifier).state = homeKey,
                  text: 'Home'),
              NavBarBottom(
                  ontap: () =>
                      ref.read(currentPageProvider.notifier).state = featureKey,
                  text: 'Proyectos'),
              NavBarBottom(
                  ontap: () => ref.read(currentPageProvider.notifier).state =
                      screenshotsKey,
                  text: 'certificaciones'),
              // NavBarBottom(
              //     ontap: () =>
              //         ref.read(currentPageProvider.notifier).state = contactKey,
              //     text: 'Contact'),
              ElevatedButton(
                  onPressed: () =>
                      ref.read(currentPageProvider.notifier).state = contactKey,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white),
                  child: Text('Contacto'))
            ],
          )),
    );
  }
}

class MobileNavbar extends HookConsumerWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = useState<double>(0.0);
    final isCrolled = ref.watch(scrolledProvider);
    final navBarColor = isCrolled ? Colors.white : Colors.white;

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 350),
          margin: EdgeInsets.only(top: 100.0),
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
                    ref.read(currentPageProvider.notifier).state = featureKey;
                    containerHeight.value = 0;
                  },
                  text: 'Features'),
              NavBarBottom(
                  ontap: () {
                    ref.read(currentPageProvider.notifier).state =
                        screenshotsKey;
                    containerHeight.value = 0;
                  },
                  text: 'Screenshots'),
              // NavBarBottom(
              //     ontap: () {
              //       ref.read(currentPageProvider.notifier).state = contactKey;
              //       containerHeight.value = 0;
              //     },
              //     text: 'Contact'),
              ElevatedButton(
                  onPressed: () {
                    ref.read(currentPageProvider.notifier).state = contactKey;
                    containerHeight.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white),
                  child: Text('Contact'))
            ]),
          ),
        ),
        Container(
          color: navBarColor,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/flutterLogo.png',
                    height: 70.0,
                  ),
                  SizedBox(width: 10.0),
                  // Text(
                  //   'Cristian Gaete',
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black87,
                  //       fontSize: 32),
                  // ),
                  Expanded(child: Container()),
                  Material(
                    child: InkWell(
                      onTap: () {
                        final height = containerHeight.value > 0 ? 0.0 : 240.0;
                        containerHeight.value = height;
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
