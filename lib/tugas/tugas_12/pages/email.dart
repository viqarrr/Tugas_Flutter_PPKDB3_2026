import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_12/widgets/centered_button.dart';

class EmailInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onValidNext;
  const EmailInput({
    super.key,
    required this.controller,
    required this.onValidNext,
  });

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String? _errorMessage;

  void _validateAndSubmit() {
    if (widget.controller.text.trim().isEmpty) {
      setState(() {
        _errorMessage = "Email tidak boleh kosong";
      });
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(widget.controller.text.trim())) {
      setState(() {
        _errorMessage = "Email tidak valid";
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Masukkan alamat emailmu",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Untuk verifikasi akun dan notifikasi.",
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
                      label: const Text("Email"),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: hasError ? Colors.red[700] : Colors.grey[600],
                      ),
                      hintText: "nama@email.com",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400],
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      // suffixIcon: suffixIcon,
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
