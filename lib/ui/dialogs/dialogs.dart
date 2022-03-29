import 'package:flutter/material.dart';

Future<void> showLoadingDialog(
  BuildContext context, {
  bool useRootNavigator = false,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return const LoadingWidget();
    },
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
