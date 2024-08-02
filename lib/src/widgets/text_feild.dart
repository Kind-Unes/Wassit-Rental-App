import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                color: Colors.black.withOpacity(.5).withOpacity(0.15),
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
                        ? Icon(
                            CupertinoIcons.eye,
                            color: Colors.black.withOpacity(.5),
                          )
                        : Icon(
                            CupertinoIcons.eye_slash,
                            color: Colors.black.withOpacity(.5),
                          ),
                  ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.black.withOpacity(.5),
            ),
            filled: false,
            fillColor: const Color.fromARGB(255, 231, 229, 255),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xAfFF7E01),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xAfFF7E01),
                width: 2,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 0), // Modify vertical padding
            labelText: widget.label,
            labelStyle: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
          obscureText: widget.isPassword ? _isObscure : false,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
