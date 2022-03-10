import 'package:flutter/material.dart';

/// bọc widget vào navigator riêng
class NavigatorBoundary extends StatelessWidget {
  const NavigatorBoundary({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (_) {
      return MaterialPageRoute(builder: (_) => child);
    });
  }
}
