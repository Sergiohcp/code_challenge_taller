import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // I used this approach to change the type of the platform in tests
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;
    if (isAndroid) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text("Android"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Welcome, Android User!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("iOS"),
      ),
      child: const Center(
        child: Text(
          "Welcome, iOS User!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );

  }
}
