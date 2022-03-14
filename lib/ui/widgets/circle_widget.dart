import 'package:flutter/material.dart';

/// {@temaplate circle_widget}
/// Widget này sẽ cắt [child] thành hình tròn, mà không can thiệp tới kích thước của chúng
/// {@endtemplate}
class CircleWidget extends StatelessWidget {
  /// {@macro circle_widget}
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