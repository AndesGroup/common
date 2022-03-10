import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}