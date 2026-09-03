import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/header_semicircle_clipper.dart';

class ProfileHeader extends StatelessWidget {
  final String profileName;
  final String email;
  final String? avatarPath;
  final VoidCallback? onSettingsTap;

  const ProfileHeader({
    super.key,
    required this.profileName,
    required this.email,
    this.avatarPath,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 215,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // ── Semicircle Curved Navy Header Banner ──
              ClipPath(
                clipper: const HeaderSemicircleClipper(curveDepth: 46.0),
                child: Container(
                  height: 165,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.deepNavy, AppColors.primaryNavy],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Lingkaran dekoratif halus di latar belakang
                      Positioned(
                        top: -35,
                        left: -35,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.05),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: -25,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.04),
                          ),
                        ),
                      ),
                      // Label aplikasi di bagian atas
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.fingerprint,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'ABSENSI PPKD',
                              style: AppTypography.caption1Bold.copyWith(
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Tombol Pengaturan (Kanan Atas) ──
              Positioned(
                top: 14,
                right: 16,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onSettingsTap,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // ── Foto Avatar Berada di Tengah Lengkungan Setengah Lingkaran ──
              Positioned(
                top: 112,
                child: _AvatarContainer(photo: avatarPath),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                profileName,
                style: AppTypography.displayLarge.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.inkDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: AppTypography.subheadlineBold.copyWith(
                  color: AppColors.muted,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  final String? photo;

  const _AvatarContainer({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: AppColors.pastelBlueBg,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surface, width: 4),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryNavy.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: _buildAvatarImage(photo),
      ),
    );
  }

  static String _sanitizePhotoUrl(String url) {
    String formatted = url.trim();

    if (formatted.startsWith('data:image')) {
      return formatted;
    }

    try {
      if (File(formatted).existsSync()) {
        return formatted;
      }
    } catch (_) {}

    if (formatted.contains('127.0.0.1:8000')) {
      formatted = formatted.replaceAll('http://127.0.0.1:8000', 'https://appabsensi.mobileprojp.com');
      formatted = formatted.replaceAll('https://127.0.0.1:8000', 'https://appabsensi.mobileprojp.com');
    } else if (formatted.contains('localhost:8000')) {
      formatted = formatted.replaceAll('http://localhost:8000', 'https://appabsensi.mobileprojp.com');
      formatted = formatted.replaceAll('https://localhost:8000', 'https://appabsensi.mobileprojp.com');
    } else if (formatted.contains('localhost')) {
      formatted = formatted.replaceAll('http://localhost', 'https://appabsensi.mobileprojp.com');
      formatted = formatted.replaceAll('https://localhost', 'https://appabsensi.mobileprojp.com');
    } else if (formatted.startsWith('/public/') || formatted.startsWith('/storage/') || formatted.startsWith('/profile_photo/')) {
      formatted = 'https://appabsensi.mobileprojp.com$formatted';
    } else if (formatted.startsWith('public/') || formatted.startsWith('storage/') || formatted.startsWith('profile_photo/')) {
      formatted = 'https://appabsensi.mobileprojp.com/$formatted';
    }
    return formatted;
  }

  Widget _buildAvatarImage(String? source) {
    if (source == null || source.trim().isEmpty) {
      return const Icon(
        Icons.person,
        size: 52,
        color: AppColors.primaryNavy,
      );
    }

    final trimmed = _sanitizePhotoUrl(source);

    // Base64 data URI or raw base64
    if (trimmed.startsWith('data:image')) {
      try {
        final commaIndex = trimmed.indexOf(',');
        final base64Str = commaIndex != -1 ? trimmed.substring(commaIndex + 1) : trimmed;
        final Uint8List bytes = base64Decode(base64Str.replaceAll(RegExp(r'\s+'), ''));
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 52, color: AppColors.primaryNavy),
        );
      } catch (_) {
        return const Icon(Icons.person, size: 52, color: AppColors.primaryNavy);
      }
    }

    // Network URL
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return Image.network(
        trimmed,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const Icon(Icons.person, size: 52, color: AppColors.primaryNavy),
      );
    }

    // Asset
    if (trimmed.startsWith('assets/')) {
      return Image.asset(
        trimmed,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const Icon(Icons.person, size: 52, color: AppColors.primaryNavy),
      );
    }

    // Local file
    try {
      final file = File(trimmed);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 52, color: AppColors.primaryNavy),
        );
      }
    } catch (_) {}

    // Raw base64 string without data prefix
    if (trimmed.length > 100 && !trimmed.contains('/')) {
      try {
        final Uint8List bytes = base64Decode(trimmed.replaceAll(RegExp(r'\s+'), ''));
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 52, color: AppColors.primaryNavy),
        );
      } catch (_) {}
    }

    return const Icon(
      Icons.person,
      size: 52,
      color: AppColors.primaryNavy,
    );
  }
}
