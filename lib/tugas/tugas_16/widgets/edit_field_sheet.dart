import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_text_field.dart';

class EditFieldSheet extends StatefulWidget {
  final String title;
  final String initialValue;
  final String? hintText;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;

  const EditFieldSheet({
    super.key,
    required this.title,
    required this.initialValue,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
  });

  static Future<String?> show(
    BuildContext context, {
    required String title,
    required String initialValue,
    String? hintText,
    Widget? prefixIcon,
    FormFieldValidator<String>? validator,
    int maxLines = 1,
    int? maxLength,
    TextInputType? keyboardType,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => EditFieldSheet(
        title: title,
        initialValue: initialValue,
        hintText: hintText,
        prefixIcon: prefixIcon,
        validator: validator,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
      ),
    );
  }

  @override
  State<EditFieldSheet> createState() => _EditFieldSheetState();
}

class _EditFieldSheetState extends State<EditFieldSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop(_controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppTypography.title2Bold.copyWith(
                      fontSize: 18,
                      color: AppColors.inkDark,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.muted),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _controller,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                validator: widget.validator,
                maxLines: widget.maxLines,
                keyboardType: widget.keyboardType,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Batal',
                      isOutlined: true,
                      height: 48,
                      borderRadius: BorderRadius.circular(24),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      text: 'Simpan',
                      height: 48,
                      borderRadius: BorderRadius.circular(24),
                      onPressed: _save,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
