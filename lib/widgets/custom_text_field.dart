import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.onChanged,
    required this.hint,
    required this.label,
    this.type,
    super.key,
  });
  final String label;
  final TextInputType? type;
  final String hint;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromRGBO(102, 139, 1, 1)),
        hintText: hint,
        label: Text(label),
        hintStyle: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
