import 'package:flutter/material.dart';

class CustomTextHomeField extends StatelessWidget {
  CustomTextHomeField(
      {this.obscureText = false, this.onChanged, this.hintText});
  bool? obscureText = false;
  String? hintText;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      onChanged: onChanged,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'this field is required';
        }
      }),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0XFF3da7ff),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF3da7ff)),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFF3da7ff),
              ),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
