import 'package:flutter/material.dart';

/// actions: a builder with dismiss callback to dismiss the dialog
Future<T?> showAlertDialog<T>(
  BuildContext context, {
  String? title,
  String? content,
  List<Widget> Function(BuildContext)? actions,
  bool barrierDismissible = true,
  bool useRootNavigator = false,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: actions?.call(context),
      );
    },
  );
}
