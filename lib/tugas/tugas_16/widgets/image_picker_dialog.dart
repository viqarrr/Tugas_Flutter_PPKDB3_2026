import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});

  static Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const ImagePickerDialog(),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      final picker = ImagePicker();
      final XFile? file = await picker.pickImage(
        source: source,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 80,
      );

      if (file != null) {
        final bytes = await file.readAsBytes();
        final base64String = base64Encode(bytes);
        final dataUri = 'data:image/jpeg;base64,$base64String';
        if (context.mounted) {
          Navigator.of(context).pop(dataUri);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal memilih gambar: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
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
                'Pilih Foto Profil',
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ActionTile(
                icon: Icons.photo_library_outlined,
                title: 'Galeri',
                onTap: () => _pickImage(context, ImageSource.gallery),
              ),
              _ActionTile(
                icon: Icons.camera_alt_outlined,
                title: 'Kamera',
                onTap: () => _pickImage(context, ImageSource.camera),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Batal',
            isOutlined: true,
            height: 48,
            borderRadius: BorderRadius.circular(24),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.pastelBlueBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryBlue.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: AppColors.primaryNavy),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTypography.caption1Bold.copyWith(
                color: AppColors.primaryNavy,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

