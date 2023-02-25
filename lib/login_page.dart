import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(192, 255, 254, 254),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.phone_bluetooth_speaker_rounded,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Hey there ! >_<',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Welcome back, glad to see you',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
          ),
          SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(45.0)),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    contentPadding: EdgeInsets.all(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(45.0)),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(20.0)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 174, 15),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text('Sign In'),
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'New coder?',
            ),
            Text(
              ' Register now',
              style: TextStyle(color: Colors.blue),
            ),
          ])
        ]),
      ),
    );
  }
}
