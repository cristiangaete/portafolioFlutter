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

class ContactsContent extends ResponsiveWidget {
  const ContactsContent({super.key});

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Contacto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
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
          const SizedBox(
            height: 24,
          ),
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
              const SizedBox(height: 24),
              Tooltip(
                message: 'Github',
                child: IconButton(
                    onPressed: () => launchUrl(github),
                    icon: const Icon(SimpleIcons.github)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MobileHomeContent extends StatelessWidget {
  SnackBar snackBar = const SnackBar(
    content: Text("¡Texto copiado con éxito!"),
    duration: Duration(milliseconds: 500),
  );

  MobileHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Contacto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          const SizedBox(
            height: 24,
          ),
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
              const SizedBox(height: 24),
              Tooltip(
                message: 'Github',
                child: IconButton(
                    onPressed: () => launchUrl(github),
                    icon: const Icon(SimpleIcons.github)),
              )
            ],
          ),
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
