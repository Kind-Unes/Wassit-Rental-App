import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.label,
      required this.icon,
      required this.isPassword,
      required this.keyBoardType,
      this.maxLines});

  final String label;
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 240, 239, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.15),
                offset: const Offset(0, 4),
                spreadRadius: 0.5,
                blurRadius: 5,
              ),
            ]),
        margin: EdgeInsets.only(bottom: 20.h),
        child: TextField(
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
                            color: Colors.blue,
                          )
                        : const Icon(
                            CupertinoIcons.eye_slash,
                            color: Colors.blue,
                          ),
                  ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.blue,
            ),
            filled: false,
            fillColor: const Color.fromARGB(255, 231, 229, 255),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 0), // Modify vertical padding
            labelText: widget.label,
            labelStyle: const TextStyle(
                color: Colors.blue,
                fontFamily: arabic,
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
          obscureText: widget.isPassword ? _isObscure : false,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: arabic,
          ),
        ),
      ),
    );
  }
}
