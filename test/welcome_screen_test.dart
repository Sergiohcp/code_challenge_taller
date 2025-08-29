import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:code_challenge_taller/presenter/welcome_screen.dart';

void main() {
  testWidgets("renders Android layout", (tester) async {
    await tester.pumpWidget(MaterialApp(theme: ThemeData(platform: TargetPlatform.android),home: WelcomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text("Welcome, Android User!"), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets("renders iOS layout", (tester) async {
    await tester.pumpWidget(  CupertinoApp(
      theme: const CupertinoThemeData(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: child!,
        );
      },
      home: const WelcomeScreen(),
    ),);
    await tester.pumpAndSettle();

    expect(find.text("Welcome, iOS User!"), findsOneWidget);
    expect(find.byType(CupertinoPageScaffold), findsOneWidget);
  });
}
