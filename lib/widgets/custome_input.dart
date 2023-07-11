import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  CustomInputField({
    super.key,
    required this.controller,
    this.isObscure,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.iconData = Icons.visibility,
    this.toggleVisibility
  });

  final TextEditingController controller;
   bool? isObscure;
  final String hintText;
  final TextInputType inputType;
  IconData iconData;
  final VoidCallback? toggleVisibility;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .65,
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          suffixIcon: isObscure!=null? IconButton(onPressed: toggleVisibility, icon: Icon(iconData)): null,
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
        obscureText: isObscure??false,
      ),
    );
  }
}