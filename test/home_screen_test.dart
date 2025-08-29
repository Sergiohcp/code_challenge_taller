import 'package:code_challenge_taller/presenter/home_screen.dart';
import 'package:code_challenge_taller/presenter/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> startApp(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(platform: TargetPlatform.android),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/welcome': (context) => const WelcomeScreen(),
        },
        initialRoute: '/home',
      ),
    );
  }

  testWidgets("renders username, password and login button", (tester) async {
    await startApp(tester);

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text("Username"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);
  });

  testWidgets("successful login navigates to WelcomeScreen", (tester) async {
    await startApp(tester);

    await tester.enterText(find.byType(TextField).at(0), "flutter");
    await tester.enterText(find.byType(TextField).at(1), "dev");

    await tester.tap(find.text("Login"));
    await tester.pumpAndSettle();

    expect(find.text("Welcome, Android User!"), findsOneWidget);
  });

  testWidgets("failed login shows snackbar", (tester) async {
    await startApp(tester);

    await tester.enterText(find.byType(TextField).at(0), "wrong");
    await tester.enterText(find.byType(TextField).at(1), "user");

    await tester.tap(find.text("Login"));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.textContaining("Something wrong happened"), findsOneWidget);
  });
}
