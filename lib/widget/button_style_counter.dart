import 'dart:io';

import 'package:flutter/material.dart';

class ButtonStyleCounter extends StatelessWidget {
  const ButtonStyleCounter({
    super.key, required this.icon, required this.press,
  });
final Icon icon;
final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 40,
        height: 32,
        child: OutlinedButton(
          onPressed: press,
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(
              Colors.white,
            ),
          ),
          child: icon,
        ),
      ),
    );
  }
}
