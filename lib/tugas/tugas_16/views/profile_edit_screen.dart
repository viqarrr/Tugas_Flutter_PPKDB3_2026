import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/models/profile_response.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/edit_field_sheet.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/image_picker_dialog.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/settings_item_tile.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/settings_section.dart';

class ProfileEditScreenTugas16 extends StatefulWidget {
  final ProfileData? initialProfile;
  final VoidCallback onLogout;

  const ProfileEditScreenTugas16({
    super.key,
    this.initialProfile,
    required this.onLogout,
  });

  static const _chevron = Icon(
    Icons.chevron_right,
    size: 20,
    color: AppColors.muted,
  );
  static const _lock = Icon(
    Icons.lock_outlined,
    size: 18,
    color: AppColors.muted,
  );

  @override
  State<ProfileEditScreenTugas16> createState() => _ProfileEditScreenTugas16State();
}

class _ProfileEditScreenTugas16State extends State<ProfileEditScreenTugas16> {
  late final ApiService _apiService;
  late String _displayName;
  late String _email;
  late String _jenisKelamin;
  String? _avatarPath;
  bool _isSaving = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);

    _displayName = widget.initialProfile?.name ?? 'Pengguna';
    _email = widget.initialProfile?.email ?? '-';
    _jenisKelamin = widget.initialProfile?.jenisKelamin ?? 'L';
    _avatarPath = widget.initialProfile?.profilePhoto;

    // Selalu utamakan avatar dari local storage
    TokenStorage.getCachedAvatar().then((cached) {
      if (cached != null && cached.isNotEmpty && mounted) {
        setState(() {
          _avatarPath = cached;
        });
      }
    });
  }

  Future<void> _pickAndUploadAvatar() async {
    final selectedImage = await ImagePickerDialog.show(context);
    if (selectedImage == null || !mounted) return;

    // 1. Simpan ke local storage secara instan
    await TokenStorage.saveAvatar(selectedImage);

    if (!mounted) return;
    setState(() {
      _avatarPath = selectedImage;
      _hasChanges = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Foto profil berhasil disimpan!'),
        backgroundColor: AppColors.emerald,
        behavior: SnackBarBehavior.floating,
      ),
    );

    // 2. Sinkronkan ke server secara background
    try {
      final token = await TokenStorage.getToken();
      if (token != null && token.isNotEmpty) {
        final authHeader = token.startsWith('Bearer ') ? token : 'Bearer $token';
        await _apiService.updateProfile(
          authHeader,
          {
            'name': _displayName,
            'profile_photo': selectedImage,
          },
        );
      }
    } catch (_) {}
  }


  Future<void> _editDisplayName() async {
    final result = await EditFieldSheet.show(
      context,
      title: 'Ubah Nama Lengkap',
      initialValue: _displayName,
      hintText: 'Contoh: Budi Hartono',
      prefixIcon: const Icon(Icons.person_outline, color: AppColors.primaryNavy),
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
    );

    if (result != null && result.isNotEmpty && mounted) {
      setState(() => _isSaving = true);

      try {
        final token = await TokenStorage.getToken();
        if (token == null || token.isEmpty) throw Exception('Token tidak ditemukan');
        final authHeader = token.startsWith('Bearer ') ? token : 'Bearer $token';
        final response = await _apiService.updateProfile(
          authHeader,
          {'name': result},
        );

        if (!mounted) return;
        setState(() {
          _displayName = result;
          _isSaving = false;
          _hasChanges = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Nama berhasil diperbarui!'),
            backgroundColor: AppColors.emerald,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } on DioException catch (e) {
        if (!mounted) return;
        setState(() => _isSaving = false);
        String msg = 'Gagal memperbarui nama.';
        if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
          final data = e.response!.data as Map<String, dynamic>;
          msg = data['message']?.toString() ?? msg;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        if (!mounted) return;
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _editEmail() async {
    final result = await EditFieldSheet.show(
      context,
      title: 'Ubah Alamat Email',
      initialValue: _email,
      hintText: 'Contoh: peserta@absensi.com',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined, color: AppColors.primaryNavy),
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return 'Email tidak boleh kosong';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(val.trim())) {
          return 'Format email tidak valid';
        }
        return null;
      },
    );

    if (result != null && result.isNotEmpty && mounted) {
      final newEmail = result.trim();
      setState(() => _isSaving = true);

      try {
        final token = await TokenStorage.getToken();
        if (token == null || token.isEmpty) throw Exception('Token tidak ditemukan');
        final authHeader = token.startsWith('Bearer ') ? token : 'Bearer $token';

        // Kirim name dan email agar validasi server (yang mewajibkan name) tetap lolos
        final response = await _apiService.updateProfile(
          authHeader,
          {
            'name': _displayName,
            'email': newEmail,
          },
        );

        if (!mounted) return;
        setState(() {
          _email = newEmail;
          _isSaving = false;
          _hasChanges = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Email berhasil diperbarui!'),
            backgroundColor: AppColors.emerald,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } on DioException catch (e) {
        if (!mounted) return;
        setState(() => _isSaving = false);
        String msg = 'Gagal memperbarui email.';
        if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
          final data = e.response!.data as Map<String, dynamic>;
          if (data['message'] != null) {
            msg = data['message'].toString();
          } else if (data['errors'] != null && data['errors'] is Map) {
            final errors = data['errors'] as Map;
            msg = errors.values.map((v) => v is List ? v.join(', ') : v.toString()).join('\n');
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        if (!mounted) return;
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Keluar dari Akun?', style: AppTypography.headlineSemiBold),
        content: Text(
          'Anda harus masuk kembali untuk mengakses data Anda.',
          style: AppTypography.bodyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Batal',
              style: AppTypography.calloutRegular.copyWith(color: AppColors.muted),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              widget.onLogout();
            },
            child: Text(
              'Keluar',
              style: AppTypography.calloutBold.copyWith(color: AppColors.pastelRedText),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final genderText = _jenisKelamin == 'L'
        ? 'Laki-laki'
        : (_jenisKelamin == 'P' ? 'Perempuan' : _jenisKelamin);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        Navigator.of(context).pop(_hasChanges);
      },
      child: Scaffold(
        backgroundColor: AppColors.searchBarSurface,
        appBar: AppBar(
          backgroundColor: AppColors.searchBarSurface,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.inkDark),
            onPressed: () => Navigator.of(context).pop(_hasChanges),
          ),
          title: Text(
            'Ubah Profil Peserta',
            style: AppTypography.displayLarge.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.inkDark,
            ),
          ),
          actions: [
            if (_isSaving)
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Avatar Edit Section
              _AvatarEditSection(
                avatarPath: _avatarPath,
                onEditTap: _pickAndUploadAvatar,
              ),
              const SizedBox(height: 28),

              // ── Informasi Akun ──
              SettingsSection(
                title: 'Informasi Akun',
                children: [
                  SettingsItemTile(
                    icon: Icons.person_outline,
                    label: 'Nama Lengkap',
                    value: _displayName,
                    trailing: ProfileEditScreenTugas16._chevron,
                    onTap: _editDisplayName,
                  ),
                  SettingsItemTile(
                    icon: Icons.transgender,
                    label: 'Jenis Kelamin',
                    value: genderText,
                    trailing: ProfileEditScreenTugas16._lock,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Jenis kelamin diset saat registrasi awal.'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                  SettingsItemTile(
                    icon: Icons.school_outlined,
                    label: 'Pelatihan',
                    value: widget.initialProfile?.trainingId != null
                        ? 'Training #${widget.initialProfile!.trainingId}'
                        : 'Mobile Programming',
                    trailing: ProfileEditScreenTugas16._lock,
                  ),
                  SettingsItemTile(
                    icon: Icons.layers_outlined,
                    label: 'Batch',
                    value: 'Batch ${widget.initialProfile?.batchId ?? 1}',
                    trailing: ProfileEditScreenTugas16._lock,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Keamanan ──
              SettingsSection(
                title: 'Keamanan & Autentikasi',
                children: [
                  SettingsItemTile(
                    icon: Icons.email_outlined,
                    label: 'Alamat Email',
                    value: _email,
                    trailing: ProfileEditScreenTugas16._chevron,
                    onTap: _editEmail,
                  ),
                  SettingsItemTile(
                    icon: Icons.vpn_key_outlined,
                    label: 'Token Autentikasi',
                    value: 'Tersimpan (Aktif)',
                    trailing: const Icon(Icons.check_circle, size: 18, color: AppColors.emerald),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ── Keluar Akun ──
              SettingsSection(
                title: 'Aksi Akun',
                children: [
                  SettingsItemTile(
                    icon: Icons.logout,
                    iconColor: AppColors.pastelRedText,
                    iconBgColor: AppColors.pastelRedText.withValues(alpha: 0.1),
                    label: 'Keluar dari Akun',
                    value: '',
                    trailing: ProfileEditScreenTugas16._chevron,
                    onTap: _showLogoutConfirmation,
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarEditSection extends StatelessWidget {
  final String? avatarPath;
  final VoidCallback onEditTap;

  const _AvatarEditSection({
    required this.avatarPath,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                color: AppColors.pastelBlueBg,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: _buildAvatarImage(avatarPath),
              ),
            ),
            GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryNavy,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onEditTap,
          child: Text(
            'Ubah Foto Profil Peserta',
            style: AppTypography.calloutBold.copyWith(
              color: AppColors.primaryNavy,
              fontSize: 14,
            ),
          ),
        ),
      ],
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
        size: 56,
        color: AppColors.primaryNavy,
      );
    }

    final trimmed = _sanitizePhotoUrl(source);

    if (trimmed.startsWith('data:image')) {
      try {
        final commaIndex = trimmed.indexOf(',');
        final base64Str = commaIndex != -1 ? trimmed.substring(commaIndex + 1) : trimmed;
        final Uint8List bytes = base64Decode(base64Str.replaceAll(RegExp(r'\s+'), ''));
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 56, color: AppColors.primaryNavy),
        );
      } catch (_) {
        return const Icon(Icons.person, size: 56, color: AppColors.primaryNavy);
      }
    }

    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return Image.network(
        trimmed,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const Icon(Icons.person, size: 56, color: AppColors.primaryNavy),
      );
    }

    if (trimmed.startsWith('assets/')) {
      return Image.asset(
        trimmed,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const Icon(Icons.person, size: 56, color: AppColors.primaryNavy),
      );
    }

    try {
      final file = File(trimmed);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 56, color: AppColors.primaryNavy),
        );
      }
    } catch (_) {}

    if (trimmed.length > 100 && !trimmed.contains('/')) {
      try {
        final Uint8List bytes = base64Decode(trimmed.replaceAll(RegExp(r'\s+'), ''));
        return Image.memory(
          bytes,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(Icons.person, size: 56, color: AppColors.primaryNavy),
        );
      } catch (_) {}
    }

    return const Icon(
      Icons.person,
      size: 56,
      color: AppColors.primaryNavy,
    );
  }
}
