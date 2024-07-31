import 'package:flutter/material.dart';
import 'package:wassit_cars_rental_app/src/core/font_family.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;

  final String optionOneText;
  final VoidCallback onOptionOne;

  final String optionTwoText;
  final VoidCallback onOptionTwo;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.optionOneText,
    required this.onOptionOne,
    required this.optionTwoText,
    required this.onOptionTwo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(

            fontWeight: FontWeight.bold,
), // Green title text color
      ),
      content: Text(
        content,
        style: const TextStyle(

            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onOptionTwo();
          },
          child: Text(
            optionTwoText,
            style: const TextStyle(
    
                fontWeight: FontWeight.bold,
                color: Colors.black54), // Grey cancel button text color
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onOptionOne();
          },
          child: Text(optionOneText,
              style: const TextStyle(
      
                  fontWeight: FontWeight.bold,
                  )),
        ),
      ],
    );
  }
}
