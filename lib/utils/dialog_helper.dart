import 'package:flutter/material.dart';

/// actions: a builder with dismiss callback to dismiss the dialog
Future<T?> showAlertDialog<T>(
  BuildContext context, {
  Widget? title,
  Widget? content,
  List<Widget>? Function(VoidCallback dismiss)? actions,
  barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions?.call(Navigator.of(context).pop),
      );
    },
  );
}
