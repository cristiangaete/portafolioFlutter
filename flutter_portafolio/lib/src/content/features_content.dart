import 'package:flutter/material.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';

class FeaturesContent extends ResponsiveWidget {
  const FeaturesContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) =>
      const FeaturesContentResponsive(horizontalPadding: 200);

  @override
  Widget buildMobile(BuildContext context) {
    // TODO: implement buildMobile
    throw UnimplementedError();
  }
}

class FeaturesContentResponsive extends StatelessWidget {
  final horizontalPadding;

  const FeaturesContentResponsive({super.key, this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Container(
      child: Padding(
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
                  //     // Scrollable.ensureVisible(
                  //     //   context,
                  //     //   alignment: 0.0,
                  //     //   duration: Duration(milliseconds: 500),
                  //     // );
                  //     _scrollController.animateTo(
                  //       _scrollController.offset - 300,
                  //       duration: Duration(milliseconds: 500),
                  //       curve: Curves.ease,
                  //     );
                  //   },
                  //   child: Icon(Icons.arrow_back), // Flecha hacia la izquierda
                  // ),
                  // SizedBox(width: 20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Evento al hacer clic en la flecha hacia la derecha
                  //     // Scrollable.ensureVisible(
                  //     //   context,
                  //     //   alignment: 1.0,
                  //     //   duration: Duration(milliseconds: 500),
                  //     // );
                  //     _scrollController.animateTo(
                  //       _scrollController.offset + 300,
                  //       duration: Duration(milliseconds: 500),
                  //       curve: Curves.ease,
                  //     );
                  //   },
                  //   child: Icon(Icons.arrow_forward), // Flecha hacia la derecha
                  // ),
                  // SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
