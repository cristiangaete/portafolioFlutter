import 'package:flutter/material.dart';
import 'package:flutter_portafolio/src/widget/responsive_widget.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ScreenshotsContents extends ResponsiveWidget {
  const ScreenshotsContents({super.key});

  @override
  Widget buildDesktop(BuildContext context) =>
      const ScreenshotsContentResponsive(200);

  @override
  Widget buildMobile(BuildContext context) => MobileHomeContent();
}

class ScreenshotsContentResponsive extends StatelessWidget {
  final horizontalPadding;
  const ScreenshotsContentResponsive(this.horizontalPadding);

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
                'Certificaciones',
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
                    _Image(
                        image: 'assets/images/certificaciones/coursera0.png'),
                    _Image(
                        image: 'assets/images/certificaciones/coursera1.png'),
                    _Image(
                        image: 'assets/images/certificaciones/coursera2.png'),
                    _Image(
                        image: 'assets/images/certificaciones/coursera3.png'),
                    _Image(
                        image: 'assets/images/certificaciones/coursera4.png'),
                    _Image(image: 'assets/images/certificaciones/udemy0.png'),
                    _Image(image: 'assets/images/certificaciones/udemy2.png'),
                    _Image(image: 'assets/images/certificaciones/udemy1.png'),
                    _Image(image: 'assets/images/certificaciones/cGato.png'),
                  ])),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({required this.image});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contrains) {
      return Row(
        children: [
          const SizedBox(width: 16),
          InstaImageViewer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                width: 800,
                height: 800,
                image,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      );
    });
  }
}

class MobileHomeContent extends StatelessWidget {
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
                'Certificaciones',
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
                    _ImageMobile(
                        image: 'assets/images/certificaciones/coursera0.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/coursera1.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/coursera2.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/coursera3.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/coursera4.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/udemy0.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/udemy2.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/udemy1.png'),
                    _ImageMobile(
                        image: 'assets/images/certificaciones/cGato.png'),
                  ])),
        ],
      ),
    );
  }
}

class _ImageMobile extends StatelessWidget {
  final String image;

  const _ImageMobile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        InstaImageViewer(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              width: 450,
              height: 450,
              image,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
