import 'package:flutter/material.dart';

class customTextFeild extends StatelessWidget {
  customTextFeild({super.key, required this.text, this.onchange,  this.onjtyy=false,});
  final String text;
  Function(String)? onchange;
  bool onjtyy;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: onjtyy!,
        validator: (value) {
          if (value!.isEmpty) {
            return 'faildi is required';
          }
        },
        onChanged: onchange,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 4))));
  }
}
