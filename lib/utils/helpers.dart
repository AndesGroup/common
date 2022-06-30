import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  } else if (mediaSrc.startsWith('files') || mediaSrc.startsWith('/')) {
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

/// random int from [start,end]
int getRandomRange(int start, int end) {
  return start + Random().nextInt(end - start + 1);
}

///////PARSER////////////
List<T?>? parseList<T extends Object?>({
  required List<dynamic>? json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return (json)
      ?.map((e) => e == null ? null : fromJson(e as Map<String, dynamic>))
      .toList();
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
  return json.map((k, e) =>
      MapEntry(k, e == null ? null : fromJson(e as Map<String, dynamic>)));
}

Map<String, T> parseMapNotNull<T extends Object?>({
  required Map<String, dynamic> json,
  required T Function(Map<String, dynamic> json) fromJson,
}) {
  return json.map((k, e) => MapEntry(k, fromJson(e as Map<String, dynamic>)));
}
////////////////////////

String? getNameFromEmail(String? email) {
  if (email == null) {
    return null;
  }
  if (email.contains('@')) {
    return email.split('@')[0];
  }
  return null;
}

Future<bool?> toast(
  String value, {
  Color? backgroundColor,
  Color? textColor,
  double? fontSize = 16,
}) {
  return Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize);
}

Future<void> copyToClipboard(String value) {
  return Clipboard.setData(ClipboardData(text: value));
}
