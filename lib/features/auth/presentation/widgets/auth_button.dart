import 'package:flutter/material.dart';
import 'package:nail_it/core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 35),
              backgroundColor: AppPallete.gradient1,
              shadowColor: AppPallete.transparentColor),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          )),
    );
  }
}
