import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;

    if (isAndroid) {
      return Scaffold(
        appBar: AppBar(title: Text("Android")),
        body: Center(
          child: Text("Welcome, Android User!"),
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Center(
        child: Text("Welcome, iOS User!"),
      ),
    );
  }
}
