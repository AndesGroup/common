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
                      child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w600),),
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

  Future<dynamic> push(Widget Function(BuildContext context) builder, {String? name}) {
    if (Platform.isAndroid) {
      return Navigator.of(this).push(MaterialPageRoute(builder: builder, settings: RouteSettings(name: name)));
    } else {
      return Navigator.of(this).push(CupertinoPageRoute(builder: builder, settings: RouteSettings(name: name)));
    }
  }

  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  void popToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  Future<dynamic> pushReplacement(Widget Function(BuildContext context) builder, {dynamic result}) {
    if (Platform.isAndroid) {
      return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: builder), result: result);
    } else {
      return Navigator.of(this).pushReplacement(CupertinoPageRoute(builder: builder), result: result);
    }
  }
}
