import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.isVisibleText = false});

  final String hintText;
  final TextEditingController textEditingController;
  final bool isVisibleText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: isVisibleText,
      validator: (value) {
        if (value!.isEmpty) return "$hintText is missing";
        return null;
      },
    );
  }
}
