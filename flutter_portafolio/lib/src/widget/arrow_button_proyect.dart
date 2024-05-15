import 'package:flutter/material.dart';
import 'package:flutter_portafolio/src/enum/arrow_direction.dart';

class ArrowButtonProyects extends StatelessWidget {
  final ArrowDirection direction;
  final ScrollController scrollController;

  const ArrowButtonProyects(
      {super.key, required this.direction, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        direction == ArrowDirection.left
            ? Icons.arrow_back_ios_new
            : Icons.arrow_forward_ios,
      ),
      onPressed: () {
        // Desplaza hacia la izquierda o derecha según la dirección del botón
        if (direction == ArrowDirection.left) {
          scrollController.animateTo(
            scrollController.offset - 980.0, // Ajusta según tus necesidades
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          scrollController.animateTo(
            scrollController.offset + 980.0, // Ajusta según tus necesidades
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
