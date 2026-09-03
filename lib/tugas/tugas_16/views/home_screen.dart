import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/models/profile_response.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/auth_selection_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/profile_edit_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/profile_header.dart';

class HomeScreenTugas16 extends StatefulWidget {
  const HomeScreenTugas16({super.key});

  @override
  State<HomeScreenTugas16> createState() => _HomeScreenTugas16State();
}

class _HomeScreenTugas16State extends State<HomeScreenTugas16> {
  late Future<ProfileResponse> _profileFuture;
  late final ApiService _apiService;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _profileFuture = _fetchProfile();
  }

  Future<ProfileResponse> _fetchProfile() async {
    final token = await TokenStorage.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Token tidak ditemukan. Silakan masuk kembali.');
    }
    final authHeader = token.startsWith('Bearer ') ? token : 'Bearer $token';
    final response = await _apiService.getProfile(authHeader);

    // Prioritas Utama: Selalu utamakan avatar yang tersimpan secara lokal di perangkat
    final cachedAvatar = await TokenStorage.getCachedAvatar();
    if (cachedAvatar != null && cachedAvatar.isNotEmpty) {
      return ProfileResponse(
        message: response.message,
        data: ProfileData(
          id: response.data?.id,
          name: response.data?.name,
          email: response.data?.email,
          emailVerifiedAt: response.data?.emailVerifiedAt,
          jenisKelamin: response.data?.jenisKelamin,
          profilePhoto: cachedAvatar,
          batchId: response.data?.batchId,
          trainingId: response.data?.trainingId,
          createdAt: response.data?.createdAt,
          updatedAt: response.data?.updatedAt,
        ),
      );
    }

    return response;
  }

  void _refreshProfile() {
    setState(() {
      _profileFuture = _fetchProfile();
    });
  }

  Future<void> _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Keluar dari Akun?', style: AppTypography.headlineSemiBold),
        content: Text(
          'Anda harus masuk kembali untuk mengakses akun dan data pelatihan Anda.',
          style: AppTypography.bodyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'Batal',
              style: AppTypography.calloutRegular.copyWith(
                color: AppColors.muted,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Keluar',
              style: AppTypography.calloutBold.copyWith(
                color: AppColors.pastelRedText,
              ),
            ),
          ),
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
      await TokenStorage.clearToken();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const AuthSelectionScreenTugas16()),
        (route) => false,
      );
    }
  }

  Future<void> _openEditProfile(ProfileData? profile) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProfileEditScreenTugas16(
          initialProfile: profile,
          onLogout: _logout,
        ),
      ),
    );

    if (mounted) {
      _refreshProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasDefault,
      body: SafeArea(
        child: FutureBuilder<ProfileResponse>(
          future: _profileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.forest,
                      ),
                      strokeWidth: 3,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Memuat profil pengguna...',
                      style: AppTypography.bodyRegular.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              String errorMsg = 'Gagal memuat profil.';
              final err = snapshot.error;
              if (err is DioException) {
                if (err.response?.data != null &&
                    err.response?.data is Map<String, dynamic>) {
                  final data = err.response!.data as Map<String, dynamic>;
                  errorMsg = data['message']?.toString() ?? errorMsg;
                } else if (err.type == DioExceptionType.connectionTimeout ||
                    err.type == DioExceptionType.connectionError) {
                  errorMsg = 'Koneksi bermasalah. Periksa jaringan Anda.';
                }
              } else if (err != null) {
                errorMsg = err.toString();
              }

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: AppColors.error,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Oops!',
                        style: AppTypography.title2Bold.copyWith(
                          color: AppColors.inkDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        errorMsg,
                        style: AppTypography.bodyRegular.copyWith(
                          color: AppColors.mutedGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            text: 'Coba Lagi',
                            height: 46,
                            borderRadius: BorderRadius.circular(23),
                            onPressed: _refreshProfile,
                          ),
                          const SizedBox(width: 12),
                          CustomButton(
                            text: 'Keluar',
                            isOutlined: true,
                            height: 46,
                            borderRadius: BorderRadius.circular(23),
                            onPressed: _logout,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            final profile = snapshot.data?.data;
            final name = profile?.name ?? 'Pengguna';
            final email = profile?.email ?? '-';
            final photo = profile?.profilePhoto;

            return RefreshIndicator(
              color: AppColors.forest,
              onRefresh: () async {
                _refreshProfile();
                await _profileFuture;
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── Header Concave Curved Forest Style ──
                    ProfileHeader(
                      profileName: name,
                      email: email,
                      avatarPath: photo,
                      onSettingsTap: () => _openEditProfile(profile),
                    ),

                    // ── Body Sections ──
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // 1. Current Status & Progress Card
                          _buildProgressSection(profile),
                          const SizedBox(height: 24),

                          // 2. Training and Academic Information Card
                          _buildAcademicInfoCard(profile),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProgressSection(ProfileData? profile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.pastelBlueBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.how_to_reg,
                      color: AppColors.primaryNavy,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Peserta Aktif PPKD',
                    style: AppTypography.headlineSemiBold.copyWith(
                      fontSize: 16,
                      color: AppColors.primaryNavy,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Batch ${profile?.batchId ?? 1}',
                  style: AppTypography.caption1Bold.copyWith(
                    color: AppColors.primaryNavy,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const LinearProgressIndicator(
              value: 0.90,
              minHeight: 8,
              backgroundColor: AppColors.canvasDefault,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryNavy),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tingkat Kehadiran Absensi',
                style: AppTypography.caption1Regular.copyWith(
                  color: AppColors.muted,
                ),
              ),
              Text(
                '90% Hadir',
                style: AppTypography.caption1Bold.copyWith(
                  color: AppColors.inkDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicInfoCard(ProfileData? profile) {
    final gender = profile?.jenisKelamin == 'L'
        ? 'Laki-laki'
        : (profile?.jenisKelamin == 'P'
              ? 'Perempuan'
              : (profile?.jenisKelamin ?? '-'));

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Text(
              'INFORMASI PESERTA & PELATIHAN PPKD',
              style: AppTypography.caption2Bold.copyWith(
                color: AppColors.muted,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          _buildInfoRow(
            icon: Icons.computer,
            label: 'ID Pelatihan',
            value: profile?.trainingId != null
                ? 'Training #${profile!.trainingId}'
                : 'Mobile Programming',
          ),
          const Divider(height: 1, indent: 54, color: AppColors.border),
          _buildInfoRow(
            icon: Icons.layers_outlined,
            label: 'Angkatan (Batch)',
            value: profile?.batchId != null
                ? 'Batch ${profile!.batchId}'
                : 'Batch 1',
          ),
          const Divider(height: 1, indent: 54, color: AppColors.border),
          _buildInfoRow(
            icon: Icons.transgender,
            label: 'Jenis Kelamin',
            value: gender,
          ),
          const Divider(height: 1, indent: 54, color: AppColors.border),
          _buildInfoRow(
            icon: Icons.tag,
            label: 'ID Pengguna',
            value: profile?.id != null ? '#${profile!.id}' : '-',
          ),
          const Divider(height: 1, indent: 54, color: AppColors.border),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.pastelBlueBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: AppColors.primaryNavy),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: AppTypography.calloutRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
          ),
          Text(
            value,
            style: AppTypography.calloutBold.copyWith(color: AppColors.inkDark),
          ),
        ],
      ),
    );
  }
}
