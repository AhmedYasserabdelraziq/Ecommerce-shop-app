import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context, required String error, Color color = Colors.black}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
      backgroundColor: color,
    ),
  );
}