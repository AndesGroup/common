import 'dart:math';

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../config/const.dart';

enum MediaType {
  network,
  asset,
  file,
}

void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (isTesting == false) {
    logger.d(message, error, stackTrace);
  }
}

MediaType getMediaType(String? mediaSrc) {
  if (isURL(mediaSrc, allowUnderscore: true)) {
    return MediaType.network;
  } else if (mediaSrc!.startsWith('assets')) {
    return MediaType.asset;
  } else if (mediaSrc.startsWith('files')) {
    return MediaType.file;
  } else {
    throw Exception('Invalid Media Type');
  }
}
T getRandomElement<T>(List<T> list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}
///////PARSER////////////
List<T?>? parseList<T extends Object?>({
  required List<dynamic>? json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return (json)?.map((e) => e == null ? null : fromJson(e as Map<String, dynamic>)).toList();
}

List<T> parseListNotNull<T extends Object?>({
  required List<dynamic> json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return (json).map((e) => fromJson(e as Map<String, dynamic>)).toList();
}

Map<String, T?> parseMap<T extends Object?>({
  required Map<String, dynamic> json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return json.map((k, e) => MapEntry(k, e == null ? null : fromJson(e as Map<String, dynamic>)));
}

Map<String, T> parseMapNotNull<T extends Object?>({
  required Map<String, dynamic> json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return json.map((k, e) => MapEntry(k, fromJson(e as Map<String, dynamic>)));
}
////////////////////////

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

Route defaultPage(Widget child) {
  return MaterialPageRoute(builder: (_) => child);
}

Route slidePage(Widget child, {AxisDirection axisDirection = AxisDirection.right}) {
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
