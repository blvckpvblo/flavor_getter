/*
 * File: main.dart
 * Flutter Plugin: Flavor Getter
 * Description: A plugin to retrieve the current flavor of the Flutter application.
 * Version: 0.0.4
 * Author: Momar Talla Cisse
 * License: BSD 3-Clause
 * Created: 2023-06-18
 * Last Modified: 2025-05-15
 */

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flavor_getter/flavor_getter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _flavor = 'Unknown';
  final _flavorGetterPlugin = FlavorGetter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String flavor;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      flavor = await _flavorGetterPlugin.getFlavor() ?? 'Unknown flavor';
    } on PlatformException {
      flavor = 'Failed to get flavor';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _flavor = flavor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flavor_getter example app'),
        ),
        body: Center(
          child: Text('Running in flavor: $_flavor\n'),
        ),
      ),
    );
  }
}
