import 'package:flutter/material.dart';
import 'package:prueba_auth/screens/signin_screen/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Body(),
    );
  }
}
