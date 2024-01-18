import 'package:flutter/material.dart';

void showErrorDialog(
  BuildContext context,
  String text,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    )
  );
}
