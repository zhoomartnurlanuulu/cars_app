// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CarsTextField extends StatelessWidget {
  const CarsTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.inputRegexp,
      required this.keyboard,
      required this.maxLength,
      required this.OnChanged})
      : super(key: key);

  final String label;
  final TextEditingController controller;
  final RegExp? inputRegexp;
  final TextInputType keyboard;
  final int maxLength;
  final Function(String? value) OnChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: OnChanged,
        keyboardType: keyboard,
        maxLength: maxLength,
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          labelText: label,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.cyan),
          ),
        ));
  }
}
