

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class NavBarBottom extends HookConsumerWidget {
  final VoidCallback ontap;
  final String text;
  const NavBarBottom({super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = useState<Color>(Colors.black);

    return MouseRegion(
      onEnter: (value){
        textColor.value = Colors.blue.shade400;
      },
      onExit: (value){
        textColor.value = Colors.black87;
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: textColor.value
              ),
            ),
            ),
        ),
      ),
    );
  }
}
