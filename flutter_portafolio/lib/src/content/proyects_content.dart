import 'package:flutter/material.dart';
import 'package:flutter_portafolio/src/widget/arrow_button_proyect.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_portafolio/src/enum/arrow_direction.dart';

final Uri gitJS = Uri.parse('https://github.com/cristiangaete/MapaJs');
final Uri github = Uri.parse('https://github.com/cristiangaete');

class FeaturesContent extends ResponsiveWidget {
  const FeaturesContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) => FeaturesContentResponsive();

  @override
  Widget buildMobile(BuildContext context) => MobileHomeContent();
}

class FeaturesContentResponsive extends StatelessWidget {
  // final horizontalPadding;

  // const FeaturesContentResponsive({super.key, this.horizontalPadding});
  final ScrollController _scrollController = ScrollController();

  FeaturesContentResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    // final ScrollController _scrollController = ScrollController();
    // List<String> imageUChile = [
    //   'assets/images/js.png',
    //   'assets/images/css.png'
    // ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Proyectos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ),
              const Expanded(child: Row()),
              ArrowButtonProyects(
                scrollController: _scrollController,
                direction: ArrowDirection.left,
              ),
              ArrowButtonProyects(
                scrollController: _scrollController,
                direction: ArrowDirection.right,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Card(
                  localImage: 'assets/images/nest.jpg',
                  text: 'Backend Nest con Autenticación, Roles, crud y TypeOrm',
                  networkImage: SimpleIcons.nestjs,
                  lenguaje: "TypeScript",
                  git: 'https://github.com/cristiangaete/nestBiblioteca',
                  // networkImage2: 'assets/images/css.png'
                ),
                _Card(
                  localImage: 'assets/images/map.png',
                  text: ' WebMapping U de Chile api google maps',
                  networkImage: SimpleIcons.javascript,
                  lenguaje: "JavaScript",
                  git: 'https://github.com/cristiangaete/MapaJs',
                  // networkImage2: 'assets/images/css.png'
                ),
                _Card(
                  localImage: 'assets/images/flutterLogo.png',
                  text: 'Portafolio Flutter',
                  networkImage: SimpleIcons.flutter,
                  lenguaje: "Flutter",
                  git: "https://github.com/cristiangaete/portafolioFlutter",
                ),
                _Card(
                  localImage: 'assets/images/flutter0.png',
                  text: 'Crud Spring Boot con servicios de correos, CSV',
                  networkImage: SimpleIcons.springboot,
                  lenguaje: "Spring Boot",
                  git: "https://github.com/cristiangaete/crudSpringBoot",
                ),
                _Card(
                  localImage: 'assets/images/dj.png',
                  text: 'Auth django',
                  networkImage: SimpleIcons.django,
                  lenguaje: "Django",
                  git: "https://github.com/cristiangaete/djangoLogin",
                ),
                _Card(
                  localImage: 'assets/images/react.png',
                  text: ' Django CRUD ReactJS',
                  networkImage: SimpleIcons.react,
                  lenguaje: "React",
                  git: "https://github.com/cristiangaete/djangoReactApp",
                ),
                _Card(
                  localImage: 'assets/images/bsale.png',
                  text: 'Prueba de programación empresa Bsale',
                  networkImage: SimpleIcons.javascript,
                  lenguaje: "javascript",
                  git: "https://github.com/cristiangaete/frontendBsale",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String localImage;
  final String? text;
  final IconData? networkImage;
  final String? lenguaje;
  final String? git;
  const _Card({
    super.key,
    required this.localImage,
    this.text,
    this.networkImage,
    this.lenguaje,
    this.git,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 16,
      ),
      SizedBox(
        width: 450,
        height: 450,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 300.0,
                width: 400.0,
                child: Image(
                  image: AssetImage(localImage),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Proyecto: ${text!}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: lenguaje,
                    child: Icon(networkImage),
                  ),
                  Tooltip(
                    message: "Github",
                    child: IconButton(
                      icon: const Icon(SimpleIcons.github),
                      onPressed: () => launchUrl(Uri.parse(git!)),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
    ]);
  }
}

class MobileHomeContent extends StatelessWidget {
  const MobileHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Proyectos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CardMovile(
                  localImage: 'assets/images/nestMovil.jpg',
                  text: 'Backend Nest con Autenticación, Roles, crud y TypeOrm',
                  networkImage: SimpleIcons.nestjs,
                  lenguaje: "TypeScript",
                  git: 'https://github.com/cristiangaete/nestBiblioteca',
                ),
                _CardMovile(
                  localImage: 'assets/images/map.png',
                  text: ' WebMapping U de Chile api google maps',
                  networkImage: SimpleIcons.javascript,
                  lenguaje: "JavaScript",
                  git: 'https://github.com/cristiangaete/MapaJs',
                ),
                _CardMovile(
                  localImage: 'assets/images/flutterCert.png',
                  text: 'Portafolio Flutter',
                  networkImage: SimpleIcons.flutter,
                  lenguaje: "Flutter",
                  git: "https://github.com/cristiangaete/portafolioFlutter",
                ),
                _CardMovile(
                  localImage: 'assets/images/flutter0.png',
                  text: 'Crud Spring Boot con servicios de correos, CSV',
                  networkImage: SimpleIcons.springboot,
                  lenguaje: "Spring Boot",
                  git: "https://github.com/cristiangaete/crudSpringBoot",
                ),
                _CardMovile(
                  localImage: 'assets/images/dj.png',
                  text: 'Auth django',
                  networkImage: SimpleIcons.django,
                  lenguaje: "Django",
                  git: "https://github.com/cristiangaete/djangoLogin",
                ),
                _CardMovile(
                  localImage: 'assets/images/reactMovil.png',
                  text: ' Django CRUD ReactJS',
                  networkImage: SimpleIcons.react,
                  lenguaje: "React",
                  git: "https://github.com/cristiangaete/djangoReactApp",
                ),
                _CardMovile(
                  localImage: 'assets/images/bsaleMovil.png',
                  text: 'Prueba de programación empresa Bsale',
                  networkImage: SimpleIcons.javascript,
                  lenguaje: "javascript",
                  git: "https://github.com/cristiangaete/frontendBsale",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardMovile extends StatelessWidget {
  final String localImage;
  final String? text;
  final IconData? networkImage;
  final String? lenguaje;
  final String? git;
  const _CardMovile({
    super.key,
    required this.localImage,
    this.text,
    this.networkImage,
    this.lenguaje,
    this.git,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 16,
      ),
      SizedBox(
        width: 300,
        height: 350,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 200.0,
                width: 300.0,
                child: Image(
                  image: AssetImage(localImage),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Proyecto: ${text!}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: lenguaje,
                    child: Icon(networkImage),
                  ),
                  Tooltip(
                    message: "Github",
                    child: IconButton(
                      icon: const Icon(SimpleIcons.github),
                      onPressed: () => launchUrl(Uri.parse(git!)),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      ),
      // const SizedBox(
      //   width: 100,
      // ),
    ]);
  }
}
