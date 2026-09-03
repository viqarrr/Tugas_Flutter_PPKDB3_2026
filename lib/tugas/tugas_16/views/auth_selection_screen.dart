import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/home_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/login_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/register_screen.dart';

class AuthSelectionScreenTugas16 extends StatefulWidget {
  const AuthSelectionScreenTugas16({super.key});

  @override
  State<AuthSelectionScreenTugas16> createState() => _AuthSelectionScreenTugas16State();
}

class _AuthSelectionScreenTugas16State extends State<AuthSelectionScreenTugas16> {
  @override
  void initState() {
    super.initState();
    _checkExistingToken();
  }

  Future<void> _checkExistingToken() async {
    final token = await TokenStorage.getToken();
    if (token != null && token.isNotEmpty && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreenTugas16()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasDefault,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Header Branding Absensi PPKD ──
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.deepNavy, AppColors.primaryNavy],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryNavy.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABSENSI PPKD',
                        style: AppTypography.title2Bold.copyWith(
                          color: AppColors.primaryNavy,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Pusat Pelatihan Kerja Daerah',
                        style: AppTypography.caption1Regular.copyWith(
                          color: AppColors.textSub,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'Portal Peserta Pelatihan',
                style: AppTypography.subheadlineBold.copyWith(
                  color: AppColors.primaryLight,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Masuk atau Daftarkan Akun Absensi Anda',
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.inkDark,
                  fontSize: 32,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Kelola absensi harian, profil peserta, dan pantau perkembangan pelatihan Anda dalam satu aplikasi.',
                style: AppTypography.bodyRegular.copyWith(
                  color: AppColors.textSub,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 36),
              // Primary Register button
              CustomButton(
                text: 'Daftar Peserta Baru',
                height: 54,
                backgroundColor: AppColors.primaryNavy,
                borderRadius: BorderRadius.circular(30),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreenTugas16(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Separator
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.border, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Atau',
                      style: AppTypography.caption1Bold.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.border, thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Masuk dengan Email
              CustomButton(
                text: 'Masuk ke Akun Anda',
                isOutlined: true,
                height: 54,
                borderRadius: BorderRadius.circular(30),
                textColor: AppColors.primaryNavy,
                icon: Icons.mail_outline,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginScreenTugas16(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
