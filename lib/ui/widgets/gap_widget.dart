import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(
    this.size, {
    Key? key,
    this.child,
  }) : super(key: key);
  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size, child: child);
  }
}
