import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_button.dart';
import 'package:nail_it/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                AuthButton(
                    text: "Sign In",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              SignInEventWithEmailandPasswordEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    }),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => context
                            .read<AuthBloc>()
                            .add(SignInWithGoogleEvent()),
                        child: const Icon(AntDesign.apple_fill)),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () => context
                            .read<AuthBloc>()
                            .add(SignInWithGoogleEvent()),
                        child: const Icon(AntDesign.google_circle_fill)),
                    const SizedBox(width: 10),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
