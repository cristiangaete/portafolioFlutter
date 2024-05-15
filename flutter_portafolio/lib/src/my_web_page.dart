import "package:flutter/material.dart";
import "package:flutter_portafolio/src/content/contacts_content.dart";
import 'package:flutter_portafolio/src/content/proyects_content.dart';
import "package:flutter_portafolio/src/content/home_content.dart";
import 'package:flutter_portafolio/src/content/certificates_content.dart';
import "package:flutter_portafolio/src/navigationBar/navbar.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final homeKey = GlobalKey();
final featureKey = GlobalKey();
final screenshotsKey = GlobalKey();
final contactKey = GlobalKey();

final currentPageProvider = StateProvider<GlobalKey>((_) => homeKey);

final scrolledProvider = StateProvider<bool>((_) => false);

class MyWebPage extends HookConsumerWidget {
  const MyWebPage({super.key});

  get onError => null;

  get onDependencyMayHaveChanged => null;

  get fireImmediately => null;

  void onScroll(ScrollController controller, WidgetRef ref) {
    // ignore: deprecated_member_use
    final isScrolled = ref.read(scrolledProvider);
    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.notifier).update((state) => true);
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.notifier).update((state) => false);
    }
  }

  void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
      duration: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() => onScroll(controller, ref));
      return controller.dispose;
    }, [controller]);

    double width = MediaQuery.of(context).size.width;
    double maxWith = width > 1200 ? 1200 : width;

    ref
        .watch(currentPageProvider.notifier)
        .addListener(scrollTo, fireImmediately: false);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: maxWith,
          child: Column(
            children: [
              const NavBar(),
              Expanded(
                  child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: <Widget>[
                    HomeContent(key: homeKey),
                    ScreenshotsContents(key: screenshotsKey),
                    FeaturesContent(key: featureKey),
                    ContactsContent(key: contactKey),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
