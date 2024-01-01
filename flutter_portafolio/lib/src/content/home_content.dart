// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

final Uri linkedin =
    Uri.parse('https://www.linkedin.com/in/cristian-gaete-jordan-b6878b17a/');
final Uri github = Uri.parse('https://github.com/cristiangaete');

class HomeContent extends ResponsiveWidget {
  const HomeContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) => DesktopHomeContent();

  @override
  Widget buildMobile(BuildContext context) => MobileHomeContent();
}

class DesktopHomeContent extends StatelessWidget {
  SnackBar snackBar = const SnackBar(
    content: Text("Correo copiado con éxito!"),
    duration: Duration(milliseconds: 500),
  );

  DesktopHomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .65,
      child: Row(children: [
        Container(
          // width: width * .3,
          margin: const EdgeInsets.only(
            top: 60.0,
            left: 20.0,
          ),
          height: 300.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: Colors.white, //PARA PROBAR CONTAINER
              borderRadius: new BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/yo.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  //SOMBRA
                  color: Color(0xffA4A4A4),
                  offset: Offset(1.0, 5.0),
                  blurRadius: 3.0,
                ),
              ]),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cristian Gaete Jordan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            const SizedBox(height: 24),
            const Text(
                'asdsadsdjhasjkhdasjkdhasjdhjkadhjksdhasjdhadhadhakhdlajhdkjlasdhklajhdjahdjkahdlahsdjlkashdkjahdjkashdkjashdkjahdkjsadhlahdlasdhlkajdshaklj'),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //     // onTap: ()=> launchUrl(url),
                //     ),
                ElevatedButton(
                  onPressed: () {
                    _descargarPDF('assets/pdf/cv.pdf');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white),
                  child: const Text('Descarga mi CV'),
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: 'Linkedin',
                  child: IconButton(
                      onPressed: () => launchUrl(linkedin),
                      icon: const Icon(SimpleIcons.linkedin)),
                ),
                const SizedBox(height: 24),
                Tooltip(
                  message: "Click para copiar mí correo electrónico",
                  child: IconButton(
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(
                                text: "cristiangaetejordan@gmail.com"))
                            .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar));
                      },
                      icon: const Icon(Icons.mail)),
                ),
                Tooltip(
                  message: 'Github',
                  child: IconButton(
                      onPressed: () => launchUrl(github),
                      icon: const Icon(SimpleIcons.github)),
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}

class MobileHomeContent extends StatelessWidget {
  SnackBar snackBar = const SnackBar(
    content: Text("Correo copiado con éxito!"),
    duration: Duration(milliseconds: 500),
  );

  MobileHomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Cristian Gaete Jordan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const SizedBox(height: 24),
          const Text(
              'asdsadsdjhasjkhdasjkdhasjdhjkadhjksdhasjdhadhadhakhdlajhdkjlasdhklajhdjahdjkahdlahsdjlkashdkjahdjkashdkjashdkjahdkjsadhlahdlasdhlkajdshaklj'),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              _descargarPDF('assets/pdf/cv.pdf');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white),
            child: const Text('Descarga mi CV'),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => launchUrl(linkedin),
                  icon: const Icon(SimpleIcons.linkedin)),
              const SizedBox(height: 24),
              Tooltip(
                message: "Click para copiar mí correo electrónico",
                child: IconButton(
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(
                              text: "cristiangaetejordan@gmail.com"))
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar));
                    },
                    icon: const Icon(Icons.mail)),
              ),
              const SizedBox(height: 24),
              IconButton(
                  onPressed: () => launchUrl(github),
                  icon: const Icon(SimpleIcons.github))
            ],
          ),
          const SizedBox(height: 1),
          Container(
            // width: width * .3,
            margin: const EdgeInsets.only(
              top: 60.0,
              left: 20.0,
            ),
            height: 350.0,
            width: 200.0,
            decoration: BoxDecoration(
                color: Colors.white, //PARA PROBAR CONTAINER
                borderRadius: new BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/yo.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    //SOMBRA
                    color: Color(0xffA4A4A4),
                    offset: Offset(1.0, 5.0),
                    blurRadius: 3.0,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

void _descargarPDF(String filePath) {
  final anchor = html.AnchorElement(href: filePath)
    ..setAttribute('download', 'cvCristianGaete.pdf')
    ..click();
}
