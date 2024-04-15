import 'package:flutter/material.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Sign In', style: TextStyle(fontSize: 30)),
            AuthField(
              hintText: "Email",
              textEditingController: emailController,
              isVisibleText: false,
            ),
            const SizedBox(height: 10),
            AuthField(
              hintText: "Password",
              textEditingController: passwordController,
              isVisibleText: true,
            ),
            const SizedBox(height: 20),
            AuthButton(text: "Sign In", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
