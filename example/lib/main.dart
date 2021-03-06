import 'package:andesgroup_common/common.dart';
import 'package:andesgroup_common/ui/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(context, actions: (dismis) {
      dismis();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: const LoadingWidget(),
    );
  }
}
