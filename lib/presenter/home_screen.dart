import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  Future<Map<String, bool>> simulateApi({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    if (username == 'flutter' && password == 'dev') {
      return {
        'success': true
      };
    }
    throw Error();
  }

  void _handleSignIn(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      await simulateApi(username: _usernameController.text, password: _passwordController.text);
      Navigator.pushNamed(context, '/welcome');
    } catch (e) {
      final snackBar = SnackBar(content: Text('Something wrong happened. Try again.'));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("test"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(controller: _usernameController, decoration: InputDecoration(labelText: "Username"),),
              SizedBox(height: 8,),
              TextField(controller: _passwordController,decoration: InputDecoration(labelText: "Password"),),
              SizedBox(height: 16,),
              ElevatedButton(
                  onPressed: isLoading ? null : () => _handleSignIn(context),
                  child: SizedBox(height: 50,child: Center(child: !isLoading ? Text("Login") : CircularProgressIndicator(strokeWidth: 1, color: Colors.blue,),),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
