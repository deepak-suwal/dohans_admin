import 'package:admin/core/util/extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final Function()? onTap;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.title,
    this.validator,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            // letterSpacing: 0.7
          ),
        ),
        8.verticalSpace,
        TextFormField(
          style: const TextStyle(fontSize: 15, letterSpacing: 0.7),
          controller: controller,
          readOnly: readOnly,
          validator: validator,
          onTap: onTap,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 2),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0x5E989898)),
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0x5E989898)),
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
