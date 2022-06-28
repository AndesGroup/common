import 'package:flutter/material.dart';

Future<T?> push<T>(BuildContext context, Widget page, {String? routeName}) {
  return Navigator.push<T>(context, defaultPage<T>(page, routeName: routeName));
}

void pop<T extends Object?>(BuildContext context, [T? result]) {
  Navigator.pop<T>(context, result);
}

void popToRoot(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

Future<T?> pushReplacement<T extends Object?, T0 extends Object?>(
    BuildContext context, Widget page,
    {T0? result}) {
  return Navigator.of(context)
      .pushReplacement<T, T0>(defaultPage<T>(page), result: result);
}

Route<T> defaultPage<T>(Widget child, {String? routeName}) {
  final routeSetting =
      routeName != null ? RouteSettings(name: routeName) : null;
  return MaterialPageRoute(builder: (_) => child, settings: routeSetting);
}

Route slidePage(Widget child,
    {AxisDirection axisDirection = AxisDirection.right}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = offsetFromDirection(axisDirection);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
/////////////////////////////

///////Transition////////////
Offset offsetFromDirection(AxisDirection axisDirection) {
  switch (axisDirection) {
    case AxisDirection.up:
      return const Offset(0.0, 1.0);
    case AxisDirection.right:
      return const Offset(1.0, 0.0);
    case AxisDirection.down:
      return const Offset(0.0, -1.0);
    case AxisDirection.left:
      return const Offset(-1.0, 0.0);
  }
}
