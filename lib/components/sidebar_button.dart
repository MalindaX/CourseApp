import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/sidebar_screen.dart';

class SidebarButton extends StatelessWidget {
  SidebarButton({required this.triggerAnimation});

  final void Function()? triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxHeight: 40,
        maxWidth: 40,
      ),
      onPressed: triggerAnimation,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16)
            ]),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      ),
    );
  }
}

