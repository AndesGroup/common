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
      return const LoadingWidget();
    },
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.radius = 10, this.color}) : super(key: key);
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(radius: radius, color: color));
  }
}
