import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showLoadingDialog(
  BuildContext context, {
  bool useRootNavigator = true,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return const LoadingDialog();
    },
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator(radius: 30, color: Colors.white));
  }
}
