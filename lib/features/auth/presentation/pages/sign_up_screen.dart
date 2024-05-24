import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.pushNamed(context, '/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Sign Up', style: TextStyle(fontSize: 30)),
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
                AuthButton(text: "Sign Up", onPressed: () {})
              ],
            ),
          );
        },
      ),
    );
  }
}
