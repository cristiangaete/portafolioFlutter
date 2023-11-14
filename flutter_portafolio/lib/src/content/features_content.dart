import 'package:flutter/material.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';

class FeaturesContent extends ResponsiveWidget {
  const FeaturesContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) =>
      const FeaturesContentResponsive(horizontalPadding: 200);

  @override
  Widget buildMobile(BuildContext context) =>
      const FeaturesContentResponsive(horizontalPadding: 24);
}

class FeaturesContentResponsive extends StatelessWidget {
  final horizontalPadding;

  const FeaturesContentResponsive({super.key, this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    List<String> imageUChile = [
      'assets/images/js.png',
      'assets/images/css.png'
    ];

    return Container(
      child: const Padding(
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
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Evento al hacer clic en la flecha hacia la izquierda
                  //     Scrollable.ensureVisible(
                  //       context,
                  //       alignment: 0.0,
                  //       duration: Duration(milliseconds: 500),
                  //     );
                  //     // _scrollController.animateTo(
                  //     //   _scrollController.offset - 300,
                  //     //   duration: Duration(milliseconds: 500),
                  //     //   curve: Curves.ease,
                  //     // );
                  //   },
                  //   child: Icon(Icons.arrow_back), // Flecha hacia la izquierda
                  // ),
                  // SizedBox(width: 20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Evento al hacer clic en la flecha hacia la derecha
                  //     Scrollable.ensureVisible(
                  //       context,
                  //       alignment: 1.0,
                  //       duration: Duration(milliseconds: 500),
                  //     );
                  //     // _scrollController.animateTo(
                  //     //   _scrollController.offset + 300,
                  //     //   duration: Duration(milliseconds: 500),
                  //     //   curve: Curves.ease,
                  //     // );
                  //   },
                  //   child: Icon(Icons.arrow_forward), // Flecha hacia la derecha
                  // ),
                  // SizedBox(width: 20),
                  _Card(
                      localImage: 'assets/images/map.jpg',
                      text: ' WebMapping U de Chile',
                      networkImage: 'assets/images/js.png',
                      networkImage2: 'assets/images/css.png'),

                  // _Card(
                  //     localImage: 'assets/images/flutter0.png',
                  //     text:
                  //         'Crud Spring Boot con servicios de correos y exportar a excel',
                  //     networkImage: 'asd'),
                  // _Card(
                  //     localImage: 'assets/images/flutterLogo.png',
                  //     text: 'Portafolio Flutter',
                  //     networkImage: 'asd'),
                  // _Card(
                  //     localImage: 'assets/images/dj.png',
                  //     text: 'hola',
                  //     networkImage: 'asd'),
                  // _Card(
                  //     localImage: 'assets/images/dj.png',
                  //     text: 'hola',
                  //     networkImage: 'asd'),
                  // _Card(
                  //     localImage: 'assets/images/dj.png',
                  //     text: 'hola',
                  //     networkImage: 'asd'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String localImage;
  final String? text;
  final String? networkImage;
  final String? networkImage2;
  // final String? link1;
  // final String? link2;
  const _Card({
    super.key,
    required this.localImage,
    this.text,
    this.networkImage,
    this.networkImage2,
    // required this.link1,
    // required this.link2
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 16,
      ),
      // Image.asset(
      //   image,
      //   height: 350,
      //   width: 350,
      // ),
      Container(
        width: 450,
        height: 450,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image(
                  image: AssetImage(localImage),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Proyecto: ' + text!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        networkImage!,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    ClipOval(
                      child: Image.asset(
                        networkImage2!,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
              // TextButton(
              //   child: const Text('GOT IT'),
              //   onPressed: () {},
              // ),
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
