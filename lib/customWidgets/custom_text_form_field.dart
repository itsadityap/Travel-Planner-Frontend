import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPasswordField = false,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
  });
  final bool isPasswordField;
  final TextInputType keyboardType;
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return isPasswordField
        ? PasswordField(
            label: label,
            controller: controller,
          )
        : TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
            ),
          );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text});
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}