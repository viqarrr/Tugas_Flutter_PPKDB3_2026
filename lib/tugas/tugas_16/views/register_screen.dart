import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/models/training_model.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_text_field.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/image_picker_dialog.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/home_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/login_screen.dart';

class RegisterScreenTugas16 extends StatefulWidget {
  const RegisterScreenTugas16({super.key});

  @override
  State<RegisterScreenTugas16> createState() => _RegisterScreenTugas16State();
}

class _RegisterScreenTugas16State extends State<RegisterScreenTugas16> {
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = List.generate(
    5,
    (_) => GlobalKey<FormState>(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    5,
    (_) => FocusNode(),
  );

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _jenisKelamin = 'L'; // 'L' or 'P'
  int _selectedBatchId = 1;
  int _selectedTrainingId = 16; // default Mobile Programming or 1
  String _profilePhotoBase64 = '';

  List<TrainingItem> _trainings = [
    TrainingItem(id: 1, title: 'Data Management Staff'),
    TrainingItem(id: 14, title: 'Web Programming'),
    TrainingItem(id: 16, title: 'Mobile Programming'),
    TrainingItem(id: 3, title: 'Desainer Grafis Madya'),
    TrainingItem(id: 9, title: 'Barista'),
  ];

  int _currentStep = 0;
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _fetchTrainings();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _focusNodes.isNotEmpty) {
        _focusNodes[0].requestFocus();
      }
    });
  }

  Future<void> _fetchTrainings() async {
    try {
      final dio = createDioClient();
      final apiService = ApiService(dio);
      final res = await apiService.getTrainings();
      if (res.data != null && res.data!.isNotEmpty && mounted) {
        setState(() {
          _trainings = res.data!;
          if (!_trainings.any((t) => t.id == _selectedTrainingId)) {
            _selectedTrainingId = _trainings.first.id;
          }
        });
      }
    } catch (_) {
      // Use predefined fallback list if API fetch fails
    }
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    _pageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentStep = index);
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted && index < _focusNodes.length) {
        _focusNodes[index].requestFocus();
      }
    });
  }

  void _nextStep() {
    final formState = _formKeys[_currentStep].currentState;
    if (formState != null && !formState.validate()) return;

    if (_currentStep < 4) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _handleRegister();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _handleRegister() async {
    setState(() => _isLoading = true);

    try {
      final dio = createDioClient();
      final apiService = ApiService(dio);

      final payload = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text,
        'jenis_kelamin': _jenisKelamin,
        'profile_photo': _profilePhotoBase64,
        'batch_id': _selectedBatchId,
        'training_id': _selectedTrainingId,
      };

      final response = await apiService.register(payload);

      if (!mounted) return;
      setState(() => _isLoading = false);

      final token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Registrasi berhasil!'),
            backgroundColor: AppColors.emerald,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomeScreenTugas16()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registrasi berhasil! Silakan masuk dengan akun Anda.'),
            backgroundColor: AppColors.emerald,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreenTugas16()),
        );
      }
    } on DioException catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      String message = 'Registrasi gagal. Silakan coba lagi.';
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        final data = e.response!.data as Map<String, dynamic>;
        if (data.containsKey('errors') && data['errors'] is Map<String, dynamic>) {
          final errors = data['errors'] as Map<String, dynamic>;
          final firstErrorList = errors.values.first;
          if (firstErrorList is List && firstErrorList.isNotEmpty) {
            message = firstErrorList.first.toString();
          }
        } else if (data.containsKey('message')) {
          message = data['message'].toString();
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasDefault,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.inkDark),
          onPressed: _previousStep,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (_currentStep + 1) / 5,
                minHeight: 6,
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryNavy,
                backgroundColor: AppColors.border,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: _onPageChanged,
                  children: [
                    _buildStepName(),
                    _buildStepGender(),
                    _buildStepEmail(),
                    _buildStepPassword(),
                    _buildStepTrainingAndPhoto(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: _currentStep == 4 ? 'Daftar Akun Absensi' : 'Lanjut',
                height: 52,
                backgroundColor: AppColors.primaryNavy,
                borderRadius: BorderRadius.circular(30),
                isLoading: _isLoading,
                onPressed: _nextStep,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Step 0: Nama Lengkap ──────────────────────────────────────────
  Widget _buildStepName() {
    return Form(
      key: _formKeys[0],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nama Lengkap Peserta',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.primaryNavy,
                fontSize: 30,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Masukkan nama lengkap sesuai data pendaftaran peserta PPKD.',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
            const SizedBox(height: 36),
            CustomTextField(
              controller: _nameController,
              focusNode: _focusNodes[0],
              label: 'Nama Lengkap',
              hintText: 'Contoh: Budi Hartono',
              prefixIcon: const Icon(Icons.badge_outlined, color: AppColors.mutedGray),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _nextStep(),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Nama tidak boleh kosong' : null,
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 1: Jenis Kelamin ────────────────────────────────────────
  Widget _buildStepGender() {
    return Form(
      key: _formKeys[1],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pilih Jenis Kelamin',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.primaryNavy,
                fontSize: 30,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Digunakan untuk pencatatan resmi absensi pelatihan PPKD.',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                Expanded(
                  child: _GenderSelectCard(
                    title: 'Laki-laki',
                    icon: Icons.male,
                    isSelected: _jenisKelamin == 'L',
                    onTap: () => setState(() => _jenisKelamin = 'L'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _GenderSelectCard(
                    title: 'Perempuan',
                    icon: Icons.female,
                    isSelected: _jenisKelamin == 'P',
                    onTap: () => setState(() => _jenisKelamin = 'P'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 2: Email ────────────────────────────────────────────────
  Widget _buildStepEmail() {
    return Form(
      key: _formKeys[2],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Alamat Email Peserta',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.primaryNavy,
                fontSize: 30,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Email digunakan sebagai identitas akun login absensi harian Anda.',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
            const SizedBox(height: 36),
            CustomTextField(
              controller: _emailC,
              focusNode: _focusNodes[2],
              label: 'Email',
              hintText: 'Contoh: peserta@absensi.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.mutedGray),
              supportingText: 'Pastikan email aktif dan valid',
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _nextStep(),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim())) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController get _emailC => _emailController;

  // ── Step 3: Kata Sandi ───────────────────────────────────────────
  Widget _buildStepPassword() {
    return Form(
      key: _formKeys[3],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Kata Sandi Akun Absensi',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.primaryNavy,
                fontSize: 30,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Minimal 8 karakter kombinasi huruf & angka untuk menjaga keamanan akun Anda.',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
            const SizedBox(height: 28),
            CustomTextField(
              controller: _passwordController,
              focusNode: _focusNodes[3],
              label: 'Kata Sandi',
              hintText: '••••••••',
              obscureText: _obscurePassword,
              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.mutedGray),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.mutedGray,
                ),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              supportingText: 'Minimal 8 karakter',
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusNodes[4].requestFocus(),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Kata sandi wajib diisi';
                if (v.length < 8) return 'Minimal 8 karakter';
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _confirmPasswordController,
              focusNode: _focusNodes[4],
              label: 'Konfirmasi Kata Sandi',
              hintText: '••••••••',
              obscureText: _obscureConfirmPassword,
              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.mutedGray),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.mutedGray,
                ),
                onPressed: () =>
                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),
              supportingText: 'Ulangi kata sandi yang sama',
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _nextStep(),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Konfirmasi kata sandi wajib diisi';
                if (v != _passwordController.text) return 'Konfirmasi kata sandi tidak cocok';
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 4: Pelatihan, Batch & Foto Profil ─────────────────────────
  Widget _buildStepTrainingAndPhoto() {
    return Form(
      key: _formKeys[4],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Program Pelatihan & Batch',
              style: AppTypography.displayLarge.copyWith(
                color: AppColors.primaryNavy,
                fontSize: 30,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Pilih program kejuruan, angkatan (batch), dan foto profil peserta Anda.',
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.mutedGray,
              ),
            ),
            const SizedBox(height: 24),
            // Avatar picker
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.pastelBlueBg,
                      border: Border.all(color: AppColors.primaryNavy, width: 2),
                    ),
                    child: ClipOval(
                      child: _profilePhotoBase64.isNotEmpty
                          ? _buildPhotoPreview(_profilePhotoBase64)
                          : const Icon(Icons.person, size: 48, color: AppColors.primaryNavy),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickAvatar,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryNavy,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: _pickAvatar,
                child: Text(
                  _profilePhotoBase64.isEmpty ? 'Pilih Foto Profil (Opsional)' : 'Ubah Foto Profil',
                  style: AppTypography.caption1Bold.copyWith(color: AppColors.primaryNavy),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Training Dropdown
            Text(
              'Program Pelatihan',
              style: AppTypography.caption1Bold.copyWith(color: AppColors.inkSoft),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border, width: 1.2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _selectedTrainingId,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.muted),
                  items: _trainings.map((t) {
                    return DropdownMenuItem<int>(
                      value: t.id,
                      child: Text(
                        t.title,
                        style: AppTypography.bodyRegular.copyWith(color: AppColors.inkDark),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedTrainingId = val);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Batch Selector
            Text(
              'Batch / Angkatan',
              style: AppTypography.caption1Bold.copyWith(color: AppColors.inkSoft),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border, width: 1.2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: _selectedBatchId,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.muted),
                  items: [1, 2, 3, 4, 5, 6, 7].map((b) {
                    return DropdownMenuItem<int>(
                      value: b,
                      child: Text(
                        'Batch $b',
                        style: AppTypography.bodyRegular.copyWith(color: AppColors.inkDark),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedBatchId = val);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoPreview(String base64Str) {
    try {
      final clean = base64Str.startsWith('data:image')
          ? base64Str.substring(base64Str.indexOf(',') + 1)
          : base64Str;
      final bytes = base64Decode(clean.replaceAll(RegExp(r'\s+'), ''));
      return Image.memory(bytes, fit: BoxFit.cover);
    } catch (_) {
      return const Icon(Icons.person, size: 48, color: AppColors.forest);
    }
  }

  Future<void> _pickAvatar() async {
    final result = await ImagePickerDialog.show(context);
    if (result != null && mounted) {
      setState(() => _profilePhotoBase64 = result);
    }
  }
}

class _GenderSelectCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderSelectCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pastelGreenBg : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.forest : AppColors.border,
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? AppColors.forest : AppColors.muted,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: isSelected
                  ? AppTypography.calloutBold.copyWith(color: AppColors.forest)
                  : AppTypography.calloutRegular,
            ),
          ],
        ),
      ),
    );
  }
}
