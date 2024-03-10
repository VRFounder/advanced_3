import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isPassword = false,
    required this.controller,
    required this.iconData,
    required this.hintText,
  });

  final bool isPassword;
  final TextEditingController controller;
  final IconData iconData;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.blueGrey.shade200,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
                child: Icon(iconData),
            ),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.redAccent
                    : Colors.blueGrey.shade200),
            focusColor: Colors.redAccent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
