import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.label,
    required this.icon,
    required this.isPassword,
    required this.keyBoardType,
    this.maxLines,
    this.hint,
  });

  final String label;
  final String? hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyBoardType;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        suffixIcon: !widget.isPassword
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: _isObscure
                    ? const Icon(
                        CupertinoIcons.eye,
                        color: Colors.white,
                      )
                    : const Icon(
                        CupertinoIcons.eye_slash,
                        color: Colors.white,
                      ),
              ),
        filled: false,

        fillColor: const Color.fromARGB(255, 231, 229, 255),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 0), // Modify vertical padding
        labelText: widget.label,
        labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 18,
            fontWeight: FontWeight.normal),
      ),
      obscureText: widget.isPassword ? _isObscure : false,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
