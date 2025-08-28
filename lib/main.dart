import 'package:flutter/material.dart';
import 'package:code_challenge_taller/presenter/home_screen.dart';
import 'package:code_challenge_taller/presenter/welcome_screen.dart';

/*
Platform-Adaptive Asynchronous Login Flow

Your task is to build a login flow that simulates a network request. Upon successful login, the user must be navigated to a welcome screen that adapts its appearance to look native on both iOS and Android.

Here are the specific requirements:

1. Build the Login UI:

- Create a screen with two TextFields (username and password) and an ElevatedButton.
2. Simulate the Login Logic:

- Create an async function that simulates a 2-second network delay using Future.delayed.

- The login should succeed if the username is flutter and the password is dev.

- Otherwise, the function should fail by throwing an Exception.
3. Manage the UI State:

- Loading State: When the login button is tapped, show a CircularProgressIndicator and disable the button.

- Error State: If the login fails, hide the loading indicator, re-enable the button, and show a SnackBar with an error message.

- Success State: If the login is successful, navigate the user to the WelcomeScreen.
4. Create a Platform-Adaptive Welcome Screen:

- This screen must detect the host operating system.

- If running on Android, it must display a Material Scaffold with an AppBar and a centered Text widget showing ""Welcome, Android User!"".

- If running on iOS, it must display a Cupertino CupertinoPageScaffold with a CupertinoNavigationBar and a centered Text widget showing ""Welcome, iOS User!"".
To keep things simple:

- You can use a StatefulWidget and setState for the login screen.

- Focus on clean, functional code, not pixel-perfect design.
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:'/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}