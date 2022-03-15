import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  showSnackBar(String message,
      {Color? backgroundColor, int? milliseconds, SnackBarAction? action, Function? onClosed}) {
    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
          content: Text(message),
          backgroundColor: backgroundColor ?? Colors.black,
          duration: Duration(milliseconds: milliseconds ?? 1000),
          action: action,
        ),
      ).closed.then((value) => onClosed);
  }
  showDialogFullscreenLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Scaffold(
              backgroundColor: Colors.black54,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
        barrierDismissible: false);
  }

  showDialogNotification(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black54,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              width: MediaQuery.of(context).size.width - 32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Notification',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    message ?? 'Something went wrong!',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        pop();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Dùng để chuyển tới một màn hình khác
  Future<dynamic> push(Widget Function(BuildContext context) builder, {String? name}) {
    if (Platform.isAndroid) {
      return Navigator.of(this)
          .push(MaterialPageRoute(builder: builder, settings: RouteSettings(name: name)));
    } else {
      return Navigator.of(this)
          .push(CupertinoPageRoute(builder: builder, settings: RouteSettings(name: name)));
    }
  }

  /// Dùng để đóng màn hình hiển tại
  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  void popToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  Future<dynamic> pushReplacement(Widget Function(BuildContext context) builder, {dynamic result}) {
    if (Platform.isAndroid) {
      return Navigator.of(this)
          .pushReplacement(MaterialPageRoute(builder: builder), result: result);
    } else {
      return Navigator.of(this)
          .pushReplacement(CupertinoPageRoute(builder: builder), result: result);
    }
  }
}

showSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  int? milliseconds,
  SnackBarAction? action,
  Function? onClosed,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.black,
        duration: Duration(milliseconds: milliseconds ?? 1000),
        action: action,
      ),
    ).closed.then((value) => onClosed);
}

Future<T?> showDialogFullscreenLoading<T>(BuildContext context) {
  return showDialog<T>(
    context: context,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          backgroundColor: Colors.black54,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
    barrierDismissible: false,
  );
}

Future<T?> showDialogNotification<T>(BuildContext context, {String? message}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            width: MediaQuery.of(context).size.width - 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Notification',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  message ?? 'Something went wrong!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Dùng để chuyển tới một màn hình mới
Future<T?> push<T>(BuildContext context, Widget Function(BuildContext context) builder,
    {String? name}) {
  if (Platform.isAndroid) {
    return Navigator.of(context)
        .push<T>(MaterialPageRoute(builder: builder, settings: RouteSettings(name: name)));
  } else {
    return Navigator.of(context)
        .push<T>(CupertinoPageRoute(builder: builder, settings: RouteSettings(name: name)));
  }
}

void pop(BuildContext context, [dynamic result]) {
  Navigator.of(context).pop(result);
}

void popToRoot(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

Future<T?> pushReplacement<T extends Object?, T0 extends Object?>(
    BuildContext context, Widget Function(BuildContext context) builder,
    {T0? result}) {
  if (Platform.isAndroid) {
    return Navigator.of(context)
        .pushReplacement<T, T0>(MaterialPageRoute(builder: builder), result: result);
  } else {
    return Navigator.of(context)
        .pushReplacement<T, T0>(CupertinoPageRoute(builder: builder), result: result);
  }
}
