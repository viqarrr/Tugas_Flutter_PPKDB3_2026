import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/widgets/centered_button.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onValidNext;
  const PasswordInput({
    super.key,
    required this.controller,
    required this.onValidNext,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  String? _errorMessage;
  bool _obscureText = true;

  void _validateAndSubmit() {
    if (widget.controller.text.trim().isEmpty) {
      setState(() {
        _errorMessage = "Password tidak boleh kosong";
      });
    } else if (RegExp(r'\s').hasMatch(widget.controller.text.trim())) {
      setState(() {
        _errorMessage = "Password tidak boleh mengandung spasi";
      });
    } else if (widget.controller.text.trim().length < 8) {
      setState(() {
        _errorMessage = "Password harus 8 karakter atau lebih";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      widget.onValidNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasError = _errorMessage != null;

    return Column(
      children: [
        Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Buat kata sandi yang aman",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Minimal 8 karakter kombinasi huruf & angka.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff818E9C),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x24E4E5E7),
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                    border: Border.all(
                      color: hasError ? Colors.red : Colors.grey,
                      width: hasError ? 1.5 : 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: TextFormField(
                    obscureText: _obscureText,
                    controller: widget.controller,
                    onChanged: (text) {
                      if (hasError && text.trim().isNotEmpty) {
                        setState(() => _errorMessage = null);
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 14,
                      ),
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      label: const Text("Password"),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: hasError ? Colors.red[700] : Colors.grey[600],
                      ),
                      hintText: "********",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400],
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                if (hasError) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),

        Expanded(child: SizedBox()),
        CenteredButton(
          onPressed: _validateAndSubmit,
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Color(0xff1C3F32),
          borderRadius: BorderRadius.circular(36),
          content: Text(
            "Lanjut",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
