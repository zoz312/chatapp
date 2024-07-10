import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text ,required this.onPressed});
  final String text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    );
  }
}
