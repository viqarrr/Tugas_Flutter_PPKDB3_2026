import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? initialValue;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff6C7278),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x24E4E5E7),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller,
                validator: validator,
                onChanged: onChanged,
                initialValue: initialValue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.5,
                    horizontal: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xffedf1f3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xffedf1f3)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
